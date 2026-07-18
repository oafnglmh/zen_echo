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

  async updateProfile(id: string, data: Partial<User>): Promise<User> {
    const prismaUser = await this.prisma.user.update({
      where: { id },
      data: {
        name: data.name !== undefined ? data.name : undefined,
        username: data.username !== undefined ? data.username : undefined,
        bio: data.bio !== undefined ? data.bio : undefined,
        avatarUrl: data.avatarUrl !== undefined ? data.avatarUrl : undefined,
        location: data.location !== undefined ? data.location : undefined,
        website: data.website !== undefined ? data.website : undefined,
        profileVisibility: data.profileVisibility !== undefined ? data.profileVisibility : undefined,
        memoryVisibility: data.memoryVisibility !== undefined ? data.memoryVisibility : undefined,
        allowShareMemories: data.allowShareMemories !== undefined ? data.allowShareMemories : undefined,
        showMemoriesOnTimeline: data.showMemoriesOnTimeline !== undefined ? data.showMemoriesOnTimeline : undefined,
        showOnlineStatus: data.showOnlineStatus !== undefined ? data.showOnlineStatus : undefined,
        allowFriendRequests: data.allowFriendRequests !== undefined ? data.allowFriendRequests : undefined,
        allowMessagesFrom: data.allowMessagesFrom !== undefined ? data.allowMessagesFrom : undefined,
      },
    });

    return this.mapToEntity(prismaUser);
  }

  async deleteUser(id: string): Promise<void> {
    await this.prisma.user.delete({
      where: { id },
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
      username: prismaUser.username,
      bio: prismaUser.bio,
      avatarUrl: prismaUser.avatarUrl,
      location: prismaUser.location,
      website: prismaUser.website,
      memoriesCount: prismaUser.memoriesCount,
      friendsCount: prismaUser.friendsCount,
      capsulesCount: prismaUser.capsulesCount,
      profileVisibility: prismaUser.profileVisibility,
      memoryVisibility: prismaUser.memoryVisibility,
      allowShareMemories: prismaUser.allowShareMemories,
      showMemoriesOnTimeline: prismaUser.showMemoriesOnTimeline,
      showOnlineStatus: prismaUser.showOnlineStatus,
      allowFriendRequests: prismaUser.allowFriendRequests,
      allowMessagesFrom: prismaUser.allowMessagesFrom,
    });
  }
}
