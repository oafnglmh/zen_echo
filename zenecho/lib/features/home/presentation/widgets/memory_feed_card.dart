import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

enum MemoryMediaType { image, video }

class MemoryItem {
  final String id;
  final String authorName;
  final String authorAvatarUrl;
  final String timeAgo;
  final MemoryMediaType mediaType;
  final String mediaUrl;
  final String? videoDuration;
  final String? moodEmoji;
  final String? moodLabel;
  final String? location;
  final String? caption;
  final int likeCount;
  final bool isLiked;

  const MemoryItem({
    required this.id,
    required this.authorName,
    required this.authorAvatarUrl,
    required this.timeAgo,
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
}

class MemoryFeedCard extends StatelessWidget {
  final MemoryItem memory;
  final VoidCallback? onLikeTap;
  final VoidCallback? onSendMsgTap;
  final VoidCallback? onMoreTap;

  const MemoryFeedCard({
    super.key,
    required this.memory,
    this.onLikeTap,
    this.onSendMsgTap,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  memory.authorAvatarUrl,
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 36,
                    height: 36,
                    color: AppColors.lightBorder,
                    child: Center(
                      child: Text(
                        memory.authorName.isNotEmpty ? memory.authorName[0] : '?',
                        style: AppTextStyles.labelMedium,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      memory.authorName,
                      style: AppTextStyles.headingSmall,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      memory.timeAgo,
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onMoreTap,
                icon: const Icon(
                  Icons.more_horiz_rounded,
                  color: AppColors.lightTextSecondary,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1.4,
                  child: Image.network(
                    memory.mediaUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFFE2E8F0),
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: AppColors.lightTextSecondary,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
                ),
                if (memory.mediaType == MemoryMediaType.video) ...[
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.35),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  Positioned(
                    left: 12,
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.volume_off_rounded,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                  if (memory.videoDuration != null)
                    Positioned(
                      right: 12,
                      bottom: 40,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          memory.videoDuration!,
                          style: AppTextStyles.tagLabel.copyWith(fontSize: 10),
                        ),
                      ),
                    ),
                ],
                if (memory.moodLabel != null || memory.moodEmoji != null)
                  Positioned(
                    left: 12,
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (memory.moodEmoji != null) ...[
                            Text(
                              memory.moodEmoji!,
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 6),
                          ],
                          if (memory.moodLabel != null)
                            Text(
                              memory.moodLabel!,
                              style: AppTextStyles.tagLabel,
                            ),
                        ],
                      ),
                    ),
                  ),
                if (memory.location != null)
                  Positioned(
                    right: 12,
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 13,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            memory.location!,
                            style: AppTextStyles.tagLabel,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (memory.caption != null && memory.caption!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              memory.caption!,
              style: AppTextStyles.bodyMedium,
            ),
          ],
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onLikeTap,
                child: Row(
                  children: [
                    Icon(
                      memory.isLiked
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: memory.isLiked
                          ? AppColors.lightDestructive
                          : AppColors.lightTextSecondary,
                      size: 22,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${memory.likeCount}',
                      style: AppTextStyles.labelMedium,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: onSendMsgTap,
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.near_me_outlined,
                        color: AppColors.lightTextSecondary,
                        size: 18,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Send',
                        style: AppTextStyles.buttonSecondary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
