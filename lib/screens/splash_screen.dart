import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/femme.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Stack(
          children: [
            // Dark gradient overlay
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xCC3A1A1C),
                      Color(0xFF3A1A1C),
                    ],
                    stops: [0.4, 0.7, 1.0],
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity: _fadeAnim,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Crown mark
                    Image.asset(
                      'assets/images/mark.png',
                      height: 64,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.workspace_premium,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Image.asset(
                      'assets/images/princess.png',
                      height: 48,
                      errorBuilder: (_, __, ___) => Text(
                        'Princess',
                        style: AppTextStyles.displayLarge,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'BEAUTY MARKETPLACE',
                      style: AppTextStyles.labelSmall.copyWith(
                        letterSpacing: 3,
                        color: AppColors.blushPink.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/loading.png',
                  height: 40,
                  opacity: const AlwaysStoppedAnimation(0.4),
                  errorBuilder: (_, __, ___) => const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: AppColors.roseMauve,
                      strokeWidth: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}