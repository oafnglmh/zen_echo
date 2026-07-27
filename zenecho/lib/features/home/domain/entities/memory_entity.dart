import 'package:equatable/equatable.dart';

enum MemoryMediaTypeEntity { image, video }

class MemoryEntity extends Equatable {
  final String id;
  final String authorName;
  final String authorAvatarUrl;
  final DateTime createdAt;
  final MemoryMediaTypeEntity mediaType;
  final String mediaUrl;
  final String? videoDuration;
  final String? moodEmoji;
  final String? moodLabel;
  final String? location;
  final String? caption;
  final int likeCount;
  final bool isLiked;

  const MemoryEntity({
    required this.id,
    required this.authorName,
    required this.authorAvatarUrl,
    required this.createdAt,
    required this.mediaType,
    required this.mediaUrl,
    this.videoDuration,
    this.moodEmoji,
    this.moodLabel,
    this.location,
    this.caption,
    required this.likeCount,
    this.isLiked = false,
  });

  @override
  List<Object?> get props => [
        id,
        authorName,
        authorAvatarUrl,
        createdAt,
        mediaType,
        mediaUrl,
        videoDuration,
        moodEmoji,
        moodLabel,
        location,
        caption,
        likeCount,
        isLiked,
      ];
}
