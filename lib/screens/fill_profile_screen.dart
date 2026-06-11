import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Fill Your Profile', style: AppTextStyles.bodyMedium.copyWith(fontSize: 16, color: Colors.white)),
        titleSpacing: 0,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          child: Column(
            children: [
              // Avatar
              Stack(
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: AppColors.inputBg,
                    backgroundImage: const AssetImage('assets/images/profile_photo.png'),
                    onBackgroundImageError: (_, __) {},
                    child: const SizedBox(),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.deepCrimson,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.scaffoldBg, width: 2),
                      ),
                      child: const Icon(Icons.edit, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              _buildField('Full Name', Icons.person_outline),
              const SizedBox(height: 14),
              _buildField('Nickname', Icons.badge_outlined),
              const SizedBox(height: 14),
              _buildField('Date of Birth', Icons.calendar_today_outlined),
              const SizedBox(height: 14),
              _buildField('Email', Icons.mail_outline),
              const SizedBox(height: 14),

              // Phone with country picker
              Container(
                decoration: BoxDecoration(
                  color: AppColors.inputBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.roseMauve.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    // Country flag/code
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 16,
                            color: const Color(0xFF009A44),
                            child: const Center(
                              child: Text('🇹🇳', style: TextStyle(fontSize: 14)),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.expand_more, color: AppColors.iconTint, size: 18),
                        ],
                      ),
                    ),
                    Container(width: 1, height: 24, color: AppColors.divider),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: AppTextStyles.bodySmall,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                          filled: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              _buildField('Gender', Icons.people_outline),
              const SizedBox(height: 32),

              PrimaryButton(
                label: 'Continue',
                onPressed: () => Navigator.pushNamed(context, '/login'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String hint, IconData icon) {
    return AppTextField(hint: hint, prefixIcon: icon);
  }
}
