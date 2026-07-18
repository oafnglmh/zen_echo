import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/otp_verification_page.dart';
import '../../features/auth/presentation/bloc/auth/auth_bloc.dart';
import '../di/dependency_injection.dart';

abstract final class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerification = '/otp-verification';
  static const String home = '/home';
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  refreshListenable: GoRouterRefreshStream(sl<AuthBloc>().stream),
  redirect: (context, state) {
    final authState = sl<AuthBloc>().state;

    final bool isSplash = state.matchedLocation == AppRoutes.splash;
    final bool isOnboarding = state.matchedLocation == AppRoutes.onboarding;
    final bool isLogin = state.matchedLocation == AppRoutes.login;
    final bool isSignUp = state.matchedLocation == AppRoutes.signUp;
    final bool isForgotPassword = state.matchedLocation == AppRoutes.forgotPassword;
    final bool isOtp = state.matchedLocation == AppRoutes.otpVerification;

    final bool isAuthPage = isLogin || isSignUp || isForgotPassword || isOtp;

    // If still in the loading or initial authentication check, stay on Splash
    final bool isInitialLoading = authState.maybeWhen(
      initial: () => true,
      loading: () => true,
      orElse: () => false,
    );

    if (isInitialLoading) {
      print('DEBUG: Router redirect: isInitialLoading = true. Redirecting to Splash if not already there.');
      return isSplash ? null : AppRoutes.splash;
    }

    print('DEBUG: Router redirect: authState = $authState, location = ${state.matchedLocation}, isInitialLoading = false');

    return authState.maybeWhen(
      authenticated: (user) {
        // Logged-in users should not see auth pages, onboarding, or splash
        if (isAuthPage || isSplash || isOnboarding) {
          return AppRoutes.home;
        }
        return null; // Proceed
      },
      orElse: () {
        // Unauthenticated users must only access auth pages, onboarding, or splash
        if (!isAuthPage && !isSplash && !isOnboarding) {
          return AppRoutes.login;
        }
        return null; // Proceed
      },
    );
  },
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.signUp,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: AppRoutes.otpVerification,
      builder: (context, state) => const OtpVerificationPage(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
