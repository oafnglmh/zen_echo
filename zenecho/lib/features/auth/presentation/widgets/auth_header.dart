import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.zenEchoLogo,
          width: 48,
          height: 48,
          alignment: Alignment.center,
        ),
        const SizedBox(height: 12),
        const Text(
          'ZenEcho',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            color: Color(0xFF141E35),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Your moments. Your story.',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color(0xFF7A8CAE),
          ),
        ),
      ],
    );
  }
}
