import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/profile.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const ProfileModel._();

  const factory ProfileModel({
    required String id,
    required String name,
    required String username,
    required String bio,
    String? avatarUrl,
    required String location,
    required String website,
    required int memoriesCount,
    required int friendsCount,
    required int capsulesCount,
    required String profileVisibility,
    required String memoryVisibility,
    required bool allowShareMemories,
    required bool showMemoriesOnTimeline,
    required bool showOnlineStatus,
    required bool allowFriendRequests,
    required String allowMessagesFrom,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  factory ProfileModel.fromEntity(Profile entity) {
    return ProfileModel(
      id: entity.id,
      name: entity.name,
      username: entity.username,
      bio: entity.bio,
      avatarUrl: entity.avatarUrl,
      location: entity.location,
      website: entity.website,
      memoriesCount: entity.memoriesCount,
      friendsCount: entity.friendsCount,
      capsulesCount: entity.capsulesCount,
      profileVisibility: entity.profileVisibility,
      memoryVisibility: entity.memoryVisibility,
      allowShareMemories: entity.allowShareMemories,
      showMemoriesOnTimeline: entity.showMemoriesOnTimeline,
      showOnlineStatus: entity.showOnlineStatus,
      allowFriendRequests: entity.allowFriendRequests,
      allowMessagesFrom: entity.allowMessagesFrom,
    );
  }

  Profile toEntity() {
    return Profile(
      id: id,
      name: name,
      username: username,
      bio: bio,
      avatarUrl: avatarUrl,
      location: location,
      website: website,
      memoriesCount: memoriesCount,
      friendsCount: friendsCount,
      capsulesCount: capsulesCount,
      profileVisibility: profileVisibility,
      memoryVisibility: memoryVisibility,
      allowShareMemories: allowShareMemories,
      showMemoriesOnTimeline: showMemoriesOnTimeline,
      showOnlineStatus: showOnlineStatus,
      allowFriendRequests: allowFriendRequests,
      allowMessagesFrom: allowMessagesFrom,
    );
  }
}
