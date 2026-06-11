import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/register_screen.dart';
import 'screens/fill_profile_screen.dart';
import 'screens/login_screen.dart';
import 'screens/auth_screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Immersive edge-to-edge display
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const PrincessBeautyApp());
}

class PrincessBeautyApp extends StatelessWidget {
  const PrincessBeautyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Princess Beauty',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/onboarding': (_) => const OnboardingScreen(),
        '/welcome': (_) => const WelcomeScreen(),
        '/register': (_) => const RegisterScreen(),
        '/fill-profile': (_) => const FillProfileScreen(),
        '/login': (_) => const LoginScreen(),
        '/forget-password': (_) => const ForgetPasswordScreen(),
        '/otp-verify': (_) => const OtpVerifyScreen(),
        '/create-password': (_) => const CreatePasswordScreen(),
        '/success': (_) => const SuccessScreen(),
      },
    );
  }
}
