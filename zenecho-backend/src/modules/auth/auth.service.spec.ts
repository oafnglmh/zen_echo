import { BadRequestException, UnauthorizedException } from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import { User } from '../../core/domain/entities/user.entity';
import { IUserRepository } from '../../core/interfaces/repositories/user-repository.interface';
import { IHashService } from '../../core/interfaces/services/hash-service.interface';
import { ITokenService } from '../../core/interfaces/services/token-service.interface';
import { AuthService } from './auth.service';

describe('AuthService', () => {
  let service: AuthService;
  let userRepository: jest.Mocked<IUserRepository>;
  let hashService: jest.Mocked<IHashService>;
  let tokenService: jest.Mocked<ITokenService>;

  const mockUser: User = {
    id: 'user-uuid-123',
    email: 'test@example.com',
    password: 'hashed-password-123',
    name: 'Test User',
    refreshToken: 'hashed-refresh-token',
    createdAt: new Date(),
    updatedAt: new Date(),
  };

  beforeEach(async () => {
    const mockUserRepoImpl = {
      create: jest.fn(),
      findByEmail: jest.fn(),
      findById: jest.fn(),
      updateRefreshToken: jest.fn(),
    };

    const mockHashServiceImpl = {
      hash: jest.fn(),
      compare: jest.fn(),
    };

    const mockTokenServiceImpl = {
      generateAccessToken: jest.fn(),
      generateRefreshToken: jest.fn(),
      verifyAccessToken: jest.fn(),
      verifyRefreshToken: jest.fn(),
    };

    const module: TestingModule = await Test.createTestingModule({
      providers: [
        AuthService,
        {
          provide: IUserRepository,
          useValue: mockUserRepoImpl,
        },
        {
          provide: IHashService,
          useValue: mockHashServiceImpl,
        },
        {
          provide: ITokenService,
          useValue: mockTokenServiceImpl,
        },
      ],
    }).compile();

    service = module.get<AuthService>(AuthService);
    userRepository = module.get(IUserRepository);
    hashService = module.get(IHashService);
    tokenService = module.get(ITokenService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('register', () => {
    const registerDto = {
      email: 'test@example.com',
      password: 'password123',
      name: 'Test User',
    };

    it('should successfully register a new user', async () => {
      userRepository.findByEmail.mockResolvedValue(null);
      hashService.hash.mockResolvedValue('hashed-password-123');
      userRepository.create.mockResolvedValue(mockUser);

      const result = await service.register(registerDto);

      expect(userRepository.findByEmail).toHaveBeenCalledWith(registerDto.email);
      expect(hashService.hash).toHaveBeenCalledWith(registerDto.password);
      expect(userRepository.create).toHaveBeenCalledWith({
        email: registerDto.email,
        password: 'hashed-password-123',
        name: registerDto.name,
      });
      expect(result).toEqual({
        id: mockUser.id,
        email: mockUser.email,
        name: mockUser.name,
        createdAt: mockUser.createdAt,
        updatedAt: mockUser.updatedAt,
      });
    });

    it('should throw BadRequestException if email already exists', async () => {
      userRepository.findByEmail.mockResolvedValue(mockUser);

      await expect(service.register(registerDto)).rejects.toThrow(BadRequestException);
      expect(userRepository.create).not.toHaveBeenCalled();
    });
  });

  describe('login', () => {
    const loginDto = {
      email: 'test@example.com',
      password: 'password123',
    };

    it('should login successfully with valid credentials', async () => {
      userRepository.findByEmail.mockResolvedValue(mockUser);
      hashService.compare.mockResolvedValue(true);
      tokenService.generateAccessToken.mockResolvedValue('access-token');
      tokenService.generateRefreshToken.mockResolvedValue('refresh-token');
      hashService.hash.mockResolvedValue('new-hashed-refresh-token');
      userRepository.updateRefreshToken.mockResolvedValue(undefined);

      const result = await service.login(loginDto);

      expect(userRepository.findByEmail).toHaveBeenCalledWith(loginDto.email);
      expect(hashService.compare).toHaveBeenCalledWith(loginDto.password, mockUser.password);
      expect(tokenService.generateAccessToken).toHaveBeenCalled();
      expect(tokenService.generateRefreshToken).toHaveBeenCalled();
      expect(userRepository.updateRefreshToken).toHaveBeenCalledWith(mockUser.id, 'new-hashed-refresh-token');
      expect(result).toEqual({
        user: {
          id: mockUser.id,
          email: mockUser.email,
          name: mockUser.name,
          createdAt: mockUser.createdAt,
          updatedAt: mockUser.updatedAt,
        },
        accessToken: 'access-token',
        refreshToken: 'refresh-token',
      });
    });

    it('should throw UnauthorizedException if user not found', async () => {
      userRepository.findByEmail.mockResolvedValue(null);

      await expect(service.login(loginDto)).rejects.toThrow(UnauthorizedException);
    });

    it('should throw UnauthorizedException if password incorrect', async () => {
      userRepository.findByEmail.mockResolvedValue(mockUser);
      hashService.compare.mockResolvedValue(false);

      await expect(service.login(loginDto)).rejects.toThrow(UnauthorizedException);
    });
  });

  describe('logout', () => {
    it('should clear refresh token in database', async () => {
      userRepository.updateRefreshToken.mockResolvedValue(undefined);

      await service.logout('user-uuid-123');

      expect(userRepository.updateRefreshToken).toHaveBeenCalledWith('user-uuid-123', null);
    });
  });

  describe('refreshTokens', () => {
    it('should rotate tokens if refresh token is valid', async () => {
      userRepository.findById.mockResolvedValue(mockUser);
      hashService.compare.mockResolvedValue(true);
      tokenService.generateAccessToken.mockResolvedValue('new-access-token');
      tokenService.generateRefreshToken.mockResolvedValue('new-refresh-token');
      hashService.hash.mockResolvedValue('new-hashed-refresh-token');
      userRepository.updateRefreshToken.mockResolvedValue(undefined);

      const result = await service.refreshTokens('user-uuid-123', 'raw-refresh-token');

      expect(userRepository.findById).toHaveBeenCalledWith('user-uuid-123');
      expect(hashService.compare).toHaveBeenCalledWith('raw-refresh-token', mockUser.refreshToken);
      expect(result).toEqual({
        accessToken: 'new-access-token',
        refreshToken: 'new-refresh-token',
      });
    });

    it('should throw UnauthorizedException if refresh token is incorrect', async () => {
      userRepository.findById.mockResolvedValue(mockUser);
      hashService.compare.mockResolvedValue(false);

      await expect(service.refreshTokens('user-uuid-123', 'invalid-token')).rejects.toThrow(UnauthorizedException);
    });

    it('should throw UnauthorizedException if user has no refresh token stored', async () => {
      const userWithoutToken = { ...mockUser, refreshToken: null };
      userRepository.findById.mockResolvedValue(userWithoutToken);

      await expect(service.refreshTokens('user-uuid-123', 'token')).rejects.toThrow(UnauthorizedException);
    });
  });
});
