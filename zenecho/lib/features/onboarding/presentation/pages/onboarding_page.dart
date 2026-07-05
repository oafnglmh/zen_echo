import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/l10n/app_locale.dart';
import '../../../../core/router/app_router.dart';
import '../../domain/entities/onboarding_item.dart';
import '../widgets/onboarding_dot_indicator.dart';
import '../widgets/onboarding_nav_button.dart';
import '../widgets/onboarding_slide_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<OnboardingItem> get _items => OnboardingItems.of(AppLocale.current);
  bool get _isLastPage => _currentIndex == _items.length - 1;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  void _onNext() {
    if (_isLastPage) {
      _navigateToHome();
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeInOut,
    );
  }

  void _navigateToHome() {
    context.go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    final itemsList = _items;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: itemsList.length,
                    itemBuilder: (context, index) {
                      return OnboardingSlideWidget(item: itemsList[index]);
                    },
                  ),
                ),
                _buildBottomControls(itemsList.length),
              ],
            ),
            if (!_isLastPage)
              Positioned(
                top: 8,
                right: 8,
                child: OnboardingNavButton(
                  label: AppLocale.current.btnSkip,
                  onTap: _navigateToHome,
                  type: OnboardingButtonType.text,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomControls(int itemCount) {
    if (_isLastPage) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OnboardingDotIndicator(
              count: itemCount,
              currentIndex: _currentIndex,
            ),
            const SizedBox(height: 32),
            OnboardingNavButton(
              label: AppLocale.current.btnGetStarted,
              onTap: _onNext,
              type: OnboardingButtonType.primary,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnboardingDotIndicator(
            count: itemCount,
            currentIndex: _currentIndex,
          ),
          OnboardingNavButton(
            label: AppLocale.current.btnNext,
            onTap: _onNext,
            type: OnboardingButtonType.circular,
          ),
        ],
      ),
    );
  }
}
