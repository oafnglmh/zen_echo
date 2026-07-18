import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { ITokenService } from '../../core/interfaces/services/token-service.interface';

@Injectable()
export class JwtTokenService implements ITokenService {
  private readonly accessSecret: string;
  private readonly accessExpiration: string;
  private readonly refreshSecret: string;
  private readonly refreshExpiration: string;

  constructor(
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
  ) {
    this.accessSecret = this.configService.get<string>('config.jwt.accessSecret')!;
    this.accessExpiration = this.configService.get<string>('config.jwt.accessExpiration')!;
    this.refreshSecret = this.configService.get<string>('config.jwt.refreshSecret')!;
    this.refreshExpiration = this.configService.get<string>('config.jwt.refreshExpiration')!;
  }

  async generateAccessToken(payload: any): Promise<string> {
    return this.jwtService.signAsync(payload, {
      secret: this.accessSecret,
      expiresIn: this.accessExpiration as any,
    });
  }

  async generateRefreshToken(payload: any): Promise<string> {
    return this.jwtService.signAsync(payload, {
      secret: this.refreshSecret,
      expiresIn: this.refreshExpiration as any,
    });
  }

  async verifyAccessToken(token: string): Promise<any> {
    return this.jwtService.verifyAsync(token, {
      secret: this.accessSecret,
    });
  }

  async verifyRefreshToken(token: string): Promise<any> {
    return this.jwtService.verifyAsync(token, {
      secret: this.refreshSecret,
    });
  }
}
