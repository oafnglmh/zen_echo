import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/l10n/app_locale.dart';
import '../../../../core/router/app_router.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/login/login_state.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_wave_background.dart';
import '../widgets/quotes_carousel_card.dart';
import '../widgets/social_auth_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF141E35).withOpacity(0.9),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5B8DEF)),
          ),
        ),
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocale.current;

    return BlocProvider<LoginBloc>(
      create: (context) => sl<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () => _showLoadingDialog(context),
            success: (user) {
              Navigator.of(context, rootNavigator: true).pop(); // dismiss loading
              context.read<AuthBloc>().add(AuthEvent.userChanged(user));
            },
            failure: (message) {
              Navigator.of(context, rootNavigator: true).pop(); // dismiss loading
              _showErrorSnackBar(context, message);
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AuthWaveBackground(),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 36),
                        const AuthHeader(),
                        const SizedBox(height: 32),
                        Text(
                          strings.authWelcomeBack,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF141E35),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          strings.authWelcomeBackSubtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.5,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF7A8CAE),
                          ),
                        ),
                        const SizedBox(height: 32),
                        AuthTextField(
                          controller: _emailController,
                          hintText: strings.authEmailAddress,
                          prefixIcon: Icons.mail_outline_rounded,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        AuthTextField(
                          controller: _passwordController,
                          hintText: strings.authPassword,
                          prefixIcon: Icons.lock_outline_rounded,
                          isPassword: true,
                        ),
                        const SizedBox(height: 14),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => context.push(AppRoutes.forgotPassword),
                            child: Text(
                              strings.authForgotPassword,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1E58C1),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        AuthButton(
                          label: strings.authSignIn,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            context.read<LoginBloc>().add(
                                  LoginEvent.submitted(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text,
                                  ),
                                );
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Expanded(child: Divider(color: Color(0xFFE2E9F6))),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                strings.authOr,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFADC4EE),
                                ),
                              ),
                            ),
                            const Expanded(child: Divider(color: Color(0xFFE2E9F6))),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SocialAuthButton(
                          label: strings.authContinueWithGoogle,
                          isGoogle: true,
                          onTap: () {},
                        ),
                        const SizedBox(height: 12),
                        SocialAuthButton(
                          label: strings.authContinueWithApple,
                          isGoogle: false,
                          onTap: () {},
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              strings.authDontHaveAccount,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF7A8CAE),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context.push(AppRoutes.signUp),
                              child: Text(
                                strings.authSignUp,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E58C1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 36),
                        QuotesCarouselCard(
                          quote: strings.authQuote1,
                          activeIndex: 0,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
