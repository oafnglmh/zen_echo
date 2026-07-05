import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class OnboardingDotIndicator extends StatelessWidget {
  const OnboardingDotIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        count,
        (i) => _Dot(active: i == currentIndex),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 10 : 7,
      height: active ? 10 : 7,
      decoration: BoxDecoration(
        color: active
            ? AppColors.brandNavy
            : const Color(0xFFCDD5E4),
        shape: BoxShape.circle,
      ),
    );
  }
}
