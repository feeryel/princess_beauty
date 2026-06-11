import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  int _selected = 0; // 0 = SMS, 1 = Email

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: buildAppBar(onBack: () => Navigator.pop(context)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text('Forget Password', style: AppTextStyles.headingLarge),
              const SizedBox(height: 12),
              Text(
                'Select which contact details should we use to reset your password',
                style: AppTextStyles.bodySmall,
              ),
              const SizedBox(height: 36),

              // Via SMS option
              _ContactOption(
                icon: Icons.message_outlined,
                label: 'Via SMS',
                subtitle: '+1 111 ******99',
                selected: _selected == 0,
                onTap: () => setState(() => _selected = 0),
              ),
              const SizedBox(height: 16),

              // Via Email option
              _ContactOption(
                icon: Icons.mail_outline,
                label: 'Via Email',
                subtitle: 'ray***matoui@domain.com',
                selected: _selected == 1,
                onTap: () => setState(() => _selected = 1),
              ),

              const Spacer(),

              PrimaryButton(
                label: 'Continue',
                onPressed: () => Navigator.pushNamed(context, '/otp-verify'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _ContactOption({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: selected ? AppColors.cardBg : AppColors.inputBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.roseMauve : AppColors.roseMauve.withOpacity(0.3),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.deepCrimson.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.bodyMedium.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(subtitle, style: AppTextStyles.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Screen 11 — OTP Verify ───────────────────────────────────────────────────
class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: buildAppBar(onBack: () => Navigator.pop(context)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text('Forget Password', style: AppTextStyles.headingLarge),
              const SizedBox(height: 12),
              Text(
                'Select which contact details should we use to reset your password',
                style: AppTextStyles.bodySmall,
              ),
              const SizedBox(height: 48),

              // OTP boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (i) => _OtpBox(controller: _controllers[i], autofocus: i == 0),
                ),
              ),
              const SizedBox(height: 32),

              // Resend
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Resend Code in ',
                    style: AppTextStyles.bodySmall,
                    children: [
                      TextSpan(
                        text: '57 s',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.blushPink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              PrimaryButton(
                label: 'Confirm',
                onPressed: () => Navigator.pushNamed(context, '/create-password'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final bool autofocus;
  const _OtpBox({required this.controller, this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: TextField(
        controller: controller,
        autofocus: autofocus,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: AppTextStyles.headingMedium,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: AppColors.inputBg,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.roseMauve.withOpacity(0.4)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.roseMauve.withOpacity(0.4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.roseMauve, width: 1.5),
          ),
        ),
        onChanged: (v) {
          if (v.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}

// ─── Screen 12 — Create New Password ─────────────────────────────────────────
class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: buildAppBar(onBack: () => Navigator.pop(context)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text('Create New\nPassword', style: AppTextStyles.headingLarge),
              const SizedBox(height: 12),
              Text('Create Your New Password', style: AppTextStyles.bodySmall),
              const SizedBox(height: 32),

              const AppTextField(
                hint: 'New password',
                prefixIcon: Icons.lock_outline,
                obscure: true,
              ),
              const SizedBox(height: 16),

              const AppTextField(
                hint: 'Confirm new password',
                prefixIcon: Icons.lock_outline,
                obscure: true,
              ),

              const Spacer(),

              PrimaryButton(
                label: 'Continue',
                onPressed: () => Navigator.pushNamed(context, '/success'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Screen 13 — Success ─────────────────────────────────────────────────────
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated check circle with decorative dots
              Stack(
                alignment: Alignment.center,
                children: [
                  // Outer glow ring
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.deepCrimson.withOpacity(0.15),
                    ),
                  ),
                  // Inner circle
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.deepCrimson.withOpacity(0.35),
                      border: Border.all(
                        color: AppColors.roseMauve.withOpacity(0.6),
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 56,
                    ),
                  ),
                  // Decorative dots
                  ..._buildDots(),
                ],
              ),
              const SizedBox(height: 48),

              Text('Successful !', style: AppTextStyles.headingLarge),
              const SizedBox(height: 16),

              Text(
                'Your account is ready to use. You will be redirected to the Home page in a few seconds.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall.copyWith(height: 1.6),
              ),
              const SizedBox(height: 64),

              PrimaryButton(
                label: 'Continue',
                onPressed: () {
                  // Navigate to home (placeholder)
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    final positions = [
      const Offset(-70, -50),
      const Offset(72, -48),
      const Offset(80, 40),
      const Offset(-76, 42),
    ];
    return positions.map((p) => Positioned(
      left: 80 + p.dx,
      top: 80 + p.dy,
      child: Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.roseMauve,
        ),
      ),
    )).toList();
  }
}
