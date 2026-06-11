import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardPage> _pages = const [
    _OnboardPage(
      imagePath: 'assets/images/services.png',
      title: 'Tailored Services\nJust For You.',
    ),
    _OnboardPage(
      imagePath: 'assets/images/mobile.png',
      title: 'Book With Ease,\nAnytime',
    ),
    _OnboardPage(
      imagePath: 'assets/images/experts.png',
      title: 'Top-Rated Experts,\nPremium Care.',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/welcome');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              // Logo mark top center
              const SizedBox(height: 24),
              Image.asset(
                'assets/images/mark.png',
                height: 36,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.workspace_premium,
                  color: Colors.white54,
                  size: 36,
                ),
              ),
              // Page content
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (i) => setState(() => _currentPage = i),
                  itemBuilder: (_, index) => _pages[index],
                ),
              ),
              // Page indicator + button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: _pages.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: AppColors.deepCrimson,
                        dotColor: AppColors.roseMauve.withOpacity(0.3),
                        spacing: 6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      label: _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                      onPressed: _nextPage,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardPage extends StatelessWidget {
  final String imagePath;
  final String title;

  const _OnboardPage({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 3D icon illustration
          Image.asset(
            imagePath,
            height: 220,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => Container(
              height: 220,
              width: 220,
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.spa, color: Colors.white38, size: 80),
            ),
          ),
          const SizedBox(height: 48),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.headingLarge,
          ),
        ],
      ),
    );
  }
}
