export class User {
  id: string;
  email: string;
  password?: string;
  name?: string | null;
  refreshToken?: string | null;
  createdAt: Date;
  updatedAt: Date;

  // Profile fields
  username?: string | null;
  bio?: string | null;
  avatarUrl?: string | null;
  location?: string | null;
  website?: string | null;

  // Statistics
  memoriesCount?: number;
  friendsCount?: number;
  capsulesCount?: number;

  // Privacy Settings
  profileVisibility?: string;
  memoryVisibility?: string;
  allowShareMemories?: boolean;
  showMemoriesOnTimeline?: boolean;
  showOnlineStatus?: boolean;
  allowFriendRequests?: boolean;
  allowMessagesFrom?: string;

  constructor(partial: Partial<User>) {
    Object.assign(this, partial);
  }
}
