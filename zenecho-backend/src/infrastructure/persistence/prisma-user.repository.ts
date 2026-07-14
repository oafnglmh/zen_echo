import { Injectable } from '@nestjs/common';
import { User } from '../../core/domain/entities/user.entity';
import { IUserRepository } from '../../core/interfaces/repositories/user-repository.interface';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class PrismaUserRepository implements IUserRepository {
  constructor(private readonly prisma: PrismaService) {}

  async create(user: Partial<User>): Promise<User> {
    if (!user.email || !user.password) {
      throw new Error('Email and password are required to create a user');
    }

    const prismaUser = await this.prisma.user.create({
      data: {
        email: user.email,
        password: user.password,
        name: user.name ?? null,
      },
    });

    return this.mapToEntity(prismaUser);
  }

  async findByEmail(email: string): Promise<User | null> {
    const prismaUser = await this.prisma.user.findUnique({
      where: { email },
    });

    if (!prismaUser) return null;
    return this.mapToEntity(prismaUser);
  }

  async findById(id: string): Promise<User | null> {
    const prismaUser = await this.prisma.user.findUnique({
      where: { id },
    });

    if (!prismaUser) return null;
    return this.mapToEntity(prismaUser);
  }

  async updateRefreshToken(id: string, hashedRefreshToken: string | null): Promise<void> {
    await this.prisma.user.update({
      where: { id },
      data: {
        refreshToken: hashedRefreshToken,
      },
    });
  }

  private mapToEntity(prismaUser: any): User {
    return new User({
      id: prismaUser.id,
      email: prismaUser.email,
      password: prismaUser.password,
      name: prismaUser.name,
      refreshToken: prismaUser.refreshToken,
      createdAt: prismaUser.createdAt,
      updatedAt: prismaUser.updatedAt,
    });
  }
}
