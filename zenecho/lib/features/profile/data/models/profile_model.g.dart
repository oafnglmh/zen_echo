// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      bio: json['bio'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      location: json['location'] as String,
      website: json['website'] as String,
      memoriesCount: (json['memoriesCount'] as num).toInt(),
      friendsCount: (json['friendsCount'] as num).toInt(),
      capsulesCount: (json['capsulesCount'] as num).toInt(),
      profileVisibility: json['profileVisibility'] as String,
      memoryVisibility: json['memoryVisibility'] as String,
      allowShareMemories: json['allowShareMemories'] as bool,
      showMemoriesOnTimeline: json['showMemoriesOnTimeline'] as bool,
      showOnlineStatus: json['showOnlineStatus'] as bool,
      allowFriendRequests: json['allowFriendRequests'] as bool,
      allowMessagesFrom: json['allowMessagesFrom'] as String,
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'bio': instance.bio,
      'avatarUrl': instance.avatarUrl,
      'location': instance.location,
      'website': instance.website,
      'memoriesCount': instance.memoriesCount,
      'friendsCount': instance.friendsCount,
      'capsulesCount': instance.capsulesCount,
      'profileVisibility': instance.profileVisibility,
      'memoryVisibility': instance.memoryVisibility,
      'allowShareMemories': instance.allowShareMemories,
      'showMemoriesOnTimeline': instance.showMemoriesOnTimeline,
      'showOnlineStatus': instance.showOnlineStatus,
      'allowFriendRequests': instance.allowFriendRequests,
      'allowMessagesFrom': instance.allowMessagesFrom,
    };
