import { User } from '../../domain/entities/user.entity';

export interface IUserRepository {
  create(user: Partial<User>): Promise<User>;
  findByEmail(email: string): Promise<User | null>;
  findById(id: string): Promise<User | null>;
  updateRefreshToken(id: string, hashedRefreshToken: string | null): Promise<void>;
}

export const IUserRepository = Symbol('IUserRepository');
