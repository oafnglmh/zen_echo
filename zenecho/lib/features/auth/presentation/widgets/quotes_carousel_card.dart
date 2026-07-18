import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class QuotesCarouselCard extends StatelessWidget {
  const QuotesCarouselCard({
    super.key,
    required this.quote,
    required this.activeIndex,
    this.totalDots = 3,
  });

  final String quote;
  final int activeIndex;
  final int totalDots;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F8FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '“',
            style: TextStyle(
              fontSize: 36,
              height: 0.6,
              fontWeight: FontWeight.w900,
              color: Color(0xFFC7D5F2),
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            quote,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5A72A0),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalDots, (index) {
              final isActive = index == activeIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: isActive ? 16 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.brandNavy : const Color(0xFFD4DFE9),
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
