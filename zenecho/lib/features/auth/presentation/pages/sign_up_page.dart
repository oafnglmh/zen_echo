import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/l10n/app_locale.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/sign_up/sign_up_bloc.dart';
import '../bloc/sign_up/sign_up_event.dart';
import '../bloc/sign_up/sign_up_state.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_checkbox.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_wave_background.dart';
import '../widgets/quotes_carousel_card.dart';
import '../widgets/social_auth_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _agreeToTerms = false;

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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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

  void _onSignUpPressed(BuildContext context) {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showErrorSnackBar(context, 'Vui lòng điền đầy đủ các thông tin bắt buộc.');
      return;
    }

    if (password != confirmPassword) {
      _showErrorSnackBar(context, 'Mật khẩu xác nhận không khớp.');
      return;
    }

    if (!_agreeToTerms) {
      _showErrorSnackBar(context, 'Bạn phải đồng ý với Điều khoản & Chính sách bảo mật.');
      return;
    }

    FocusScope.of(context).unfocus();
    context.read<SignUpBloc>().add(
          SignUpEvent.submitted(
            email: email,
            password: password,
            name: name,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocale.current;

    return BlocProvider<SignUpBloc>(
      create: (context) => sl<SignUpBloc>(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
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
                          strings.authCreateAccount,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF141E35),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          strings.authCreateAccountSubtitle,
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
                          controller: _nameController,
                          hintText: strings.authFullName,
                          prefixIcon: Icons.person_outline_rounded,
                        ),
                        const SizedBox(height: 16),
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
                        const SizedBox(height: 16),
                        AuthTextField(
                          controller: _confirmPasswordController,
                          hintText: strings.authConfirmPassword,
                          prefixIcon: Icons.lock_outline_rounded,
                          isPassword: true,
                        ),
                        const SizedBox(height: 16),
                        AuthCheckbox(
                          value: _agreeToTerms,
                          onChanged: (val) {
                            setState(() {
                              _agreeToTerms = val ?? false;
                            });
                          },
                          label: 'I agree to the ',
                          highlightedLabel: 'Terms & Privacy Policy',
                          onHighlightTap: () {},
                        ),
                        const SizedBox(height: 24),
                        AuthButton(
                          label: strings.authCreateAccount,
                          onTap: () => _onSignUpPressed(context),
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
                              strings.authAlreadyHaveAccount,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF7A8CAE),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context.pop(),
                              child: Text(
                                strings.authSignInLink,
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
                          quote: strings.authQuote2,
                          activeIndex: 1,
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
