import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String name;
  final String username;
  final String bio;
  final String? avatarUrl;
  final String location;
  final String website;

  // Stats
  final int memoriesCount;
  final int friendsCount;
  final int capsulesCount;

  // Privacy Settings
  final String profileVisibility;
  final String memoryVisibility;
  final bool allowShareMemories;
  final bool showMemoriesOnTimeline;
  final bool showOnlineStatus;
  final bool allowFriendRequests;
  final String allowMessagesFrom;

  const Profile({
    required this.id,
    required this.name,
    required this.username,
    required this.bio,
    this.avatarUrl,
    required this.location,
    required this.website,
    required this.memoriesCount,
    required this.friendsCount,
    required this.capsulesCount,
    required this.profileVisibility,
    required this.memoryVisibility,
    required this.allowShareMemories,
    required this.showMemoriesOnTimeline,
    required this.showOnlineStatus,
    required this.allowFriendRequests,
    required this.allowMessagesFrom,
  });

  Profile copyWith({
    String? id,
    String? name,
    String? username,
    String? bio,
    String? avatarUrl,
    String? location,
    String? website,
    int? memoriesCount,
    int? friendsCount,
    int? capsulesCount,
    String? profileVisibility,
    String? memoryVisibility,
    bool? allowShareMemories,
    bool? showMemoriesOnTimeline,
    bool? showOnlineStatus,
    bool? allowFriendRequests,
    String? allowMessagesFrom,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      location: location ?? this.location,
      website: website ?? this.website,
      memoriesCount: memoriesCount ?? this.memoriesCount,
      friendsCount: friendsCount ?? this.friendsCount,
      capsulesCount: capsulesCount ?? this.capsulesCount,
      profileVisibility: profileVisibility ?? this.profileVisibility,
      memoryVisibility: memoryVisibility ?? this.memoryVisibility,
      allowShareMemories: allowShareMemories ?? this.allowShareMemories,
      showMemoriesOnTimeline: showMemoriesOnTimeline ?? this.showMemoriesOnTimeline,
      showOnlineStatus: showOnlineStatus ?? this.showOnlineStatus,
      allowFriendRequests: allowFriendRequests ?? this.allowFriendRequests,
      allowMessagesFrom: allowMessagesFrom ?? this.allowMessagesFrom,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        bio,
        avatarUrl,
        location,
        website,
        memoriesCount,
        friendsCount,
        capsulesCount,
        profileVisibility,
        memoryVisibility,
        allowShareMemories,
        showMemoriesOnTimeline,
        showOnlineStatus,
        allowFriendRequests,
        allowMessagesFrom,
      ];
}
