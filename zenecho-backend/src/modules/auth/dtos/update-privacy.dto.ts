import { IsBoolean, IsOptional, IsString } from 'class-validator';

export class UpdatePrivacyDto {
  @IsString()
  @IsOptional()
  profileVisibility?: string;

  @IsString()
  @IsOptional()
  memoryVisibility?: string;

  @IsBoolean()
  @IsOptional()
  allowShareMemories?: boolean;

  @IsBoolean()
  @IsOptional()
  showMemoriesOnTimeline?: boolean;

  @IsBoolean()
  @IsOptional()
  showOnlineStatus?: boolean;

  @IsBoolean()
  @IsOptional()
  allowFriendRequests?: boolean;

  @IsString()
  @IsOptional()
  allowMessagesFrom?: string;
}
