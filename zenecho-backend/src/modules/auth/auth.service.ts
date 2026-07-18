import { BadRequestException, Inject, Injectable, UnauthorizedException } from '@nestjs/common';
import { User } from '../../core/domain/entities/user.entity';
import { IUserRepository } from '../../core/interfaces/repositories/user-repository.interface';
import { IHashService } from '../../core/interfaces/services/hash-service.interface';
import { ITokenService } from '../../core/interfaces/services/token-service.interface';
import { LoginDto } from './dtos/login.dto';
import { RegisterDto } from './dtos/register.dto';
import { UpdateProfileDto } from './dtos/update-profile.dto';
import { UpdatePrivacyDto } from './dtos/update-privacy.dto';

@Injectable()
export class AuthService {
  constructor(
    @Inject(IUserRepository)
    private readonly userRepository: IUserRepository,
    @Inject(IHashService)
    private readonly hashService: IHashService,
    @Inject(ITokenService)
    private readonly tokenService: ITokenService,
  ) {}

  async register(dto: RegisterDto): Promise<Omit<User, 'password' | 'refreshToken'>> {
    const existingUser = await this.userRepository.findByEmail(dto.email);
    if (existingUser) {
      throw new BadRequestException('Email is already in use');
    }

    const hashedPassword = await this.hashService.hash(dto.password);
    const user = await this.userRepository.create({
      email: dto.email,
      password: hashedPassword,
      name: dto.name,
    });

    const { password, refreshToken, ...userWithoutSecrets } = user;
    return userWithoutSecrets;
  }

  async login(dto: LoginDto) {
    const user = await this.userRepository.findByEmail(dto.email);
    if (!user || !user.password) {
      throw new UnauthorizedException('Invalid credentials');
    }

    const isPasswordValid = await this.hashService.compare(dto.password, user.password);
    if (!isPasswordValid) {
      throw new UnauthorizedException('Invalid credentials');
    }

    const tokens = await this.generateTokens(user.id, user.email);
    await this.updateRefreshToken(user.id, tokens.refreshToken);

    const { password, refreshToken, ...userWithoutSecrets } = user;
    return {
      user: userWithoutSecrets,
      ...tokens,
    };
  }

  async logout(userId: string): Promise<void> {
    await this.userRepository.updateRefreshToken(userId, null);
  }

  async refreshTokens(userId: string, refreshToken: string) {
    const user = await this.userRepository.findById(userId);
    if (!user || !user.refreshToken) {
      throw new UnauthorizedException('Access Denied');
    }

    const isRefreshTokenValid = await this.hashService.compare(refreshToken, user.refreshToken);
    if (!isRefreshTokenValid) {
      throw new UnauthorizedException('Access Denied');
    }

    const tokens = await this.generateTokens(user.id, user.email);
    await this.updateRefreshToken(user.id, tokens.refreshToken);

    return tokens;
  }

  private async generateTokens(userId: string, email: string) {
    const payload = { sub: userId, email };
    const [accessToken, refreshToken] = await Promise.all([
      this.tokenService.generateAccessToken(payload),
      this.tokenService.generateRefreshToken(payload),
    ]);

    return {
      accessToken,
      refreshToken,
    };
  }

  private async updateRefreshToken(userId: string, refreshToken: string) {
    const hashedToken = await this.hashService.hash(refreshToken);
    await this.userRepository.updateRefreshToken(userId, hashedToken);
  }

  async updateProfile(userId: string, dto: UpdateProfileDto): Promise<Omit<User, 'password' | 'refreshToken'>> {
    const updatedUser = await this.userRepository.updateProfile(userId, dto);
    const { password, refreshToken, ...userWithoutSecrets } = updatedUser;
    return userWithoutSecrets;
  }

  async updatePrivacy(userId: string, dto: UpdatePrivacyDto): Promise<Omit<User, 'password' | 'refreshToken'>> {
    const updatedUser = await this.userRepository.updateProfile(userId, dto);
    const { password, refreshToken, ...userWithoutSecrets } = updatedUser;
    return userWithoutSecrets;
  }

  async updateAvatar(userId: string, avatarUrl: string): Promise<Omit<User, 'password' | 'refreshToken'>> {
    const updatedUser = await this.userRepository.updateProfile(userId, { avatarUrl });
    const { password, refreshToken, ...userWithoutSecrets } = updatedUser;
    return userWithoutSecrets;
  }

  async deleteAccount(userId: string): Promise<void> {
    await this.userRepository.deleteUser(userId);
  }
}
