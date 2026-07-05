import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'animated_logo_widget.dart';
import 'ripple_ring_widget.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({super.key});

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _textCtrl;
  late final Animation<double> _textFade;
  late final Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();
    _textCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _textFade = CurvedAnimation(parent: _textCtrl, curve: Curves.easeOut);
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textCtrl, curve: Curves.easeOutCubic));
  }

  void _onLogoAnimationComplete() {
    if (mounted) _textCtrl.forward();
  }

  @override
  void dispose() {
    _textCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final maxRipple = screenSize.shortestSide * 0.55;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.expand(
          child: Stack(
            alignment: Alignment.center,
            children: [
              RippleRingWidget(
                delay: Duration.zero,
                maxRadius: maxRipple * 0.5,
                strokeWidth: 1.2,
                color: AppColors.ripple,
              ),
              RippleRingWidget(
                delay: const Duration(milliseconds: 700),
                maxRadius: maxRipple * 0.75,
                strokeWidth: 0.8,
                color: AppColors.rippleFaint,
              ),
              RippleRingWidget(
                delay: const Duration(milliseconds: 1400),
                maxRadius: maxRipple,
                strokeWidth: 0.5,
                color: AppColors.rippleFaint,
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedLogoWidget(
              size: screenSize.shortestSide * 0.28,
              onAnimationComplete: _onLogoAnimationComplete,
            ),
            const SizedBox(height: 32),
            FadeTransition(
              opacity: _textFade,
              child: SlideTransition(
                position: _textSlide,
                child: const _AppNameText(),
              ),
            ),
            const SizedBox(height: 10),
            FadeTransition(
              opacity: _textFade,
              child: SlideTransition(
                position: _textSlide,
                child: const _TaglineText(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AppNameText extends StatelessWidget {
  const _AppNameText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'ZenEcho',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w300,
        letterSpacing: 6,
        color: AppColors.textPrimary,
        shadows: [
          Shadow(
            color: AppColors.accent.withValues(alpha: 0.35),
            blurRadius: 18,
          ),
        ],
      ),
    );
  }
}

class _TaglineText extends StatelessWidget {
  const _TaglineText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Breathe. Listen. Be.',
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 3.5,
        color: AppColors.textSubtle,
      ),
    );
  }
}
