import '../../../../core/constants/app_assets.dart';
import '../../../../core/l10n/app_strings.dart';

class OnboardingItem {
  const OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  final String imagePath;
  final String title;
  final String subtitle;
}

abstract final class OnboardingItems {
  static List<OnboardingItem> of(AppStrings s) => [
    OnboardingItem(
      imagePath: AppAssets.onboardingOne,
      title: s.onb1Title,
      subtitle: s.onb1Subtitle,
    ),
    OnboardingItem(
      imagePath: AppAssets.onboardingTwo,
      title: s.onb2Title,
      subtitle: s.onb2Subtitle,
    ),
    OnboardingItem(
      imagePath: AppAssets.onboardingThree,
      title: s.onb3Title,
      subtitle: s.onb3Subtitle,
    ),
  ];
}
