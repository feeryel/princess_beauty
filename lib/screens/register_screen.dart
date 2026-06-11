import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _rememberMe = false;
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: buildAppBar(
        onBack: () => Navigator.pop(context),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text('Create your\nAccount', style: AppTextStyles.headingLarge),
              const SizedBox(height: 36),

              // Email
              AppTextField(
                hint: 'Email Address',
                prefixIcon: Icons.mail_outline,
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Password
              AppTextField(
                hint: 'Password',
                prefixIcon: Icons.lock_outline,
                controller: _passCtrl,
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
                label: 'Sign up',
                onPressed: () => Navigator.pushNamed(context, '/fill-profile'),
              ),
              const SizedBox(height: 32),

              const OrDivider(),
              const SizedBox(height: 24),

              const SocialButtonsRow(),
              const SizedBox(height: 32),

              // Already have account
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/login'),
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: AppTextStyles.bodySmall,
                      children: [
                        TextSpan(
                          text: 'Sign in',
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
