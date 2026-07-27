import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class FriendStory {
  final String id;
  final String name;
  final String avatarUrl;
  final bool hasPostedToday;

  const FriendStory({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.hasPostedToday = true,
  });
}

class FriendsAvatarBar extends StatelessWidget {
  final List<FriendStory> friends;
  final VoidCallback? onAddMomentTap;
  final Function(FriendStory)? onFriendTap;

  const FriendsAvatarBar({
    super.key,
    required this.friends,
    this.onAddMomentTap,
    this.onFriendTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: friends.length + 1,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildAddYourMomentItem();
          }
          final friend = friends[index - 1];
          return _buildFriendAvatarItem(friend);
        },
      ),
    );
  }

  Widget _buildAddYourMomentItem() {
    return GestureDetector(
      onTap: onAddMomentTap,
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: AppColors.lightAccent.withValues(alpha: 0.12),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.lightAccent.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: const Icon(
              Icons.add_rounded,
              color: AppColors.lightAccent,
              size: 26,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your Moment',
            style: AppTextStyles.labelSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildFriendAvatarItem(FriendStory friend) {
    return GestureDetector(
      onTap: () => onFriendTap?.call(friend),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: friend.hasPostedToday
                        ? AppColors.lightAccent
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    friend.avatarUrl,
                    width: 52,
                    height: 52,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 52,
                      height: 52,
                      color: AppColors.lightBorder,
                      child: Center(
                        child: Text(
                          friend.name.isNotEmpty ? friend.name[0] : '?',
                          style: AppTextStyles.labelMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C55E),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            friend.name,
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.lightTextPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
