import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 6), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/femme.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),

          // Gradient overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0xBB4B2A2B),
                  Color(0xFF3A1A1C),
                ],
                stops: [0.35, 0.65, 1.0],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text('Step Inside', style: AppTextStyles.headingLarge),
                  const SizedBox(height: 6),

                  Image.asset(
                    'assets/images/princess.png',
                    height: 44,
                    alignment: Alignment.centerLeft,
                    errorBuilder: (_, __, ___) => Text(
                      'Princess',
                      style: AppTextStyles.displayLarge.copyWith(
                        fontStyle: FontStyle.italic,
                        color: AppColors.warmBrown,
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),
                  Text(
                    'BEAUTY MARKETPLACE',
                    style: AppTextStyles.labelSmall.copyWith(letterSpacing: 3),
                  ),

                  const SizedBox(height: 36),

                  _SocialWideButton(
                    icon: const Text(
                      'G',
                      style: TextStyle(
                        color: Color(0xFFEA4335),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    label: 'Continue with Google',
                    onPressed: () {},
                  ),

                  const SizedBox(height: 12),

                  _SocialWideButton(
                    icon: const Icon(Icons.apple, color: Colors.white, size: 22),
                    label: 'Continue with Apple',
                    onPressed: () {},
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(child: Divider(color: AppColors.divider)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text('or', style: AppTextStyles.bodySmall),
                      ),
                      Expanded(child: Divider(color: AppColors.divider)),
                    ],
                  ),

                  const SizedBox(height: 16),

                  PrimaryButton(
                    label: 'Sign in with password',
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),

                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialWideButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialWideButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.inputBg,
          side: BorderSide(color: AppColors.roseMauve.withOpacity(0.5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        icon: icon,
        label: Text(label, style: AppTextStyles.buttonText),
        onPressed: onPressed,
      ),
    );
  }
}