import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { IUserRepository } from '../../core/interfaces/repositories/user-repository.interface';
import { IHashService } from '../../core/interfaces/services/hash-service.interface';
import { ITokenService } from '../../core/interfaces/services/token-service.interface';
import { PrismaUserRepository } from '../../infrastructure/persistence/prisma-user.repository';
import { BcryptHashService } from '../../infrastructure/security/bcrypt-hash.service';
import { JwtTokenService } from '../../infrastructure/security/jwt-token.service';
import { JwtRefreshStrategy } from '../../infrastructure/security/strategies/jwt-refresh.strategy';
import { JwtStrategy } from '../../infrastructure/security/strategies/jwt.strategy';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';

@Module({
  imports: [
    PassportModule.register({ defaultStrategy: 'jwt' }),
    JwtModule.register({}),
  ],
  controllers: [AuthController],
  providers: [
    AuthService,
    JwtStrategy,
    JwtRefreshStrategy,
    {
      provide: IUserRepository,
      useClass: PrismaUserRepository,
    },
    {
      provide: IHashService,
      useClass: BcryptHashService,
    },
    {
      provide: ITokenService,
      useClass: JwtTokenService,
    },
  ],
  exports: [AuthService, IUserRepository, IHashService, ITokenService],
})
export class AuthModule {}
