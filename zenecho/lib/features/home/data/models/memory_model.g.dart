// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoryModelImpl _$$MemoryModelImplFromJson(Map<String, dynamic> json) =>
    _$MemoryModelImpl(
      id: json['id'] as String,
      authorName: json['authorName'] as String,
      authorAvatarUrl: json['authorAvatarUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      mediaType: json['mediaType'] as String,
      mediaUrl: json['mediaUrl'] as String,
      videoDuration: json['videoDuration'] as String?,
      moodEmoji: json['moodEmoji'] as String?,
      moodLabel: json['moodLabel'] as String?,
      location: json['location'] as String?,
      caption: json['caption'] as String?,
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
      isLiked: json['isLiked'] as bool? ?? false,
    );

Map<String, dynamic> _$$MemoryModelImplToJson(_$MemoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorName': instance.authorName,
      'authorAvatarUrl': instance.authorAvatarUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'mediaType': instance.mediaType,
      'mediaUrl': instance.mediaUrl,
      'videoDuration': instance.videoDuration,
      'moodEmoji': instance.moodEmoji,
      'moodLabel': instance.moodLabel,
      'location': instance.location,
      'caption': instance.caption,
      'likeCount': instance.likeCount,
      'isLiked': instance.isLiked,
    };
