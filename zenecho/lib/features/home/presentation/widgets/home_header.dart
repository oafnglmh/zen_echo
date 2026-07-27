import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onMessagesTap;

  const HomeHeader({
    super.key,
    required this.userName,
    this.onNotificationTap,
    this.onMessagesTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('ZenEcho', style: AppTextStyles.brandTitle),
            Row(
              children: [
                IconButton(
                  onPressed: onNotificationTap,
                  icon: Stack(
                    children: [
                      const Icon(
                        Icons.notifications_none_rounded,
                        color: AppColors.lightTextPrimary,
                        size: 24,
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.lightAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onMessagesTap,
                  icon: const Icon(
                    Icons.near_me_outlined,
                    color: AppColors.lightTextPrimary,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text('Good morning, $userName 👋', style: AppTextStyles.headingLarge),
        const SizedBox(height: 4),
        const Text(
          'See what your friends are cherishing today.',
          style: AppTextStyles.bodySubtle,
        ),
      ],
    );
  }
}
