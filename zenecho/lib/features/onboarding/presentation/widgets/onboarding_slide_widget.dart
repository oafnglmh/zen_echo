import 'package:flutter/material.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/onboarding_item.dart';

class OnboardingSlideWidget extends StatelessWidget {
  const OnboardingSlideWidget({super.key, required this.item});

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 55,
          child: _SlideImage(imagePath: item.imagePath),
        ),
        Expanded(
          flex: 45,
          child: _SlideText(title: item.title, subtitle: item.subtitle),
        ),
      ],
    );
  }
}

class _SlideImage extends StatelessWidget {
  const _SlideImage({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}

class _SlideText extends StatelessWidget {
  const _SlideText({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.onboardingHeading,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),
          Text(
            subtitle,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

