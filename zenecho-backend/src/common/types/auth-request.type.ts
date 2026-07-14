import { Request } from 'express';

export interface AuthenticatedUser {
  id: string;
  email: string;
  refreshToken?: string;
}

export interface AuthenticatedRequest extends Request {
  user: AuthenticatedUser;
}
