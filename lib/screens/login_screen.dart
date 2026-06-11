import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: buildAppBar(onBack: () => Navigator.pop(context)),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text('Login to Your\nAccount', style: AppTextStyles.headingLarge),
              const SizedBox(height: 36),

              const AppTextField(
                hint: 'Email Address',
                prefixIcon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              const AppTextField(
                hint: 'Password',
                prefixIcon: Icons.lock_outline,
                obscure: true,
              ),
              const SizedBox(height: 12),

              // Remember me
              Row(
                children: [
                  Transform.scale(
                    scale: 0.85,
                    child: Checkbox(
                      value: _rememberMe,
                      activeColor: AppColors.deepCrimson,
                      checkColor: Colors.white,
                      side: BorderSide(color: AppColors.roseMauve.withOpacity(0.6)),
                      onChanged: (v) => setState(() => _rememberMe = v ?? false),
                    ),
                  ),
                  Text('Remember me', style: AppTextStyles.bodySmall),
                ],
              ),
              const SizedBox(height: 24),

              PrimaryButton(
                label: 'Sign in',
                onPressed: () => Navigator.pushNamed(context, '/forget-password'),
              ),
              const SizedBox(height: 16),

              // Forgot password
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/forget-password'),
                  child: Text(
                    'Forgot password?',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.blushPink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              const OrDivider(),
              const SizedBox(height: 24),

              const SocialButtonsRow(),
              const SizedBox(height: 32),

              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/register'),
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: AppTextStyles.bodySmall,
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.blushPink,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
