import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../enums/onboarding_button_type.dart';
export '../enums/onboarding_button_type.dart';

class OnboardingNavButton extends StatelessWidget {
  const OnboardingNavButton({
    super.key,
    required this.label,
    required this.onTap,
    this.type = OnboardingButtonType.primary,
  });

  final String label;
  final VoidCallback onTap;
  final OnboardingButtonType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case OnboardingButtonType.primary:
        return _PrimaryButton(label: label, onTap: onTap);
      case OnboardingButtonType.circular:
        return _CircularButton(onTap: onTap);
      case OnboardingButtonType.text:
        return _TextButton(label: label, onTap: onTap);
    }
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: AppColors.brandNavy,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.brandNavy.withValues(alpha: 0.15),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.buttonPrimary,
          ),
        ),
      ),
    );
  }
}

class _CircularButton extends StatelessWidget {
  const _CircularButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: AppColors.brandNavy,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class _TextButton extends StatelessWidget {
  const _TextButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFF7A8CAE),
          ),
        ),
      ),
    );
  }
}
