import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/memory_entity.dart';

part 'memory_model.freezed.dart';
part 'memory_model.g.dart';

@freezed
class MemoryModel with _$MemoryModel {
  const MemoryModel._();

  const factory MemoryModel({
    required String id,
    required String authorName,
    required String authorAvatarUrl,
    required DateTime createdAt,
    required String mediaType,
    required String mediaUrl,
    String? videoDuration,
    String? moodEmoji,
    String? moodLabel,
    String? location,
    String? caption,
    @Default(0) int likeCount,
    @Default(false) bool isLiked,
  }) = _MemoryModel;

  factory MemoryModel.fromJson(Map<String, dynamic> json) =>
      _$MemoryModelFromJson(json);

  MemoryEntity toEntity() => MemoryEntity(
        id: id,
        authorName: authorName,
        authorAvatarUrl: authorAvatarUrl,
        createdAt: createdAt,
        mediaType: mediaType == 'video'
            ? MemoryMediaTypeEntity.video
            : MemoryMediaTypeEntity.image,
        mediaUrl: mediaUrl,
        videoDuration: videoDuration,
        moodEmoji: moodEmoji,
        moodLabel: moodLabel,
        location: location,
        caption: caption,
        likeCount: likeCount,
        isLiked: isLiked,
      );

  factory MemoryModel.fromEntity(MemoryEntity entity) => MemoryModel(
        id: entity.id,
        authorName: entity.authorName,
        authorAvatarUrl: entity.authorAvatarUrl,
        createdAt: entity.createdAt,
        mediaType: entity.mediaType == MemoryMediaTypeEntity.video ? 'video' : 'image',
        mediaUrl: entity.mediaUrl,
        videoDuration: entity.videoDuration,
        moodEmoji: entity.moodEmoji,
        moodLabel: entity.moodLabel,
        location: entity.location,
        caption: entity.caption,
        likeCount: entity.likeCount,
        isLiked: entity.isLiked,
      );
}
