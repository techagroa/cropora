import 'package:flutter/material.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/app_images.dart';

class LanguageSelectScreen extends StatefulWidget {
  const LanguageSelectScreen({super.key});

  @override
  State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
  int _selectedLanguageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============================================================
              // IMAGE SECTION
              // ============================================================
              SizedBox(
                height: screenHeight * 0.42,
                width: double.infinity,
                child: Stack(
                  children: [
                    // Full image - no border, no fade
                    Positioned.fill(
                      child: Image.asset(
                        AppImages.farmerField,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Cropora branding badge
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: AppColors.primaryAppColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.eco,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Cropora',
                                style: TextStyle(
                                  color: AppColors.primaryTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ============================================================
              // CONTENT SECTION - STARTS AFTER IMAGE
              // ============================================================
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main title
                    const Text(
                      'Smarter Farming,\nBetter Future',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextColor,
                        height: 1.25,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Description
                    const Text(
                      'Your agricultural information, farm records, marketplace and services — all in one place.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Select language title
                    const Text(
                      'SELECT LANGUAGE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 0.5,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // English
                    _buildLanguageCard(
                      index: 0,
                      primaryLabel: 'English',
                      secondaryLabel: '',
                    ),

                    const SizedBox(height: 10),

                    // Sinhala
                    _buildLanguageCard(
                      index: 1,
                      primaryLabel: 'සිංහල',
                      secondaryLabel: 'Sinhala',
                    ),

                    const SizedBox(height: 10),

                    // Tamil
                    _buildLanguageCard(
                      index: 2,
                      primaryLabel: 'தமிழ்',
                      secondaryLabel: 'Tamil',
                    ),

                    const SizedBox(height: 24),

                    // ======================================================
                    // CONTINUE BUTTON
                    // ======================================================
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryAppColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ======================================================
                    // CONTINUE AS GUEST BUTTON
                    // ======================================================
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFFE0E0E0),
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Continue as Guest',
                          style: TextStyle(
                            color: AppColors.primaryTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // LANGUAGE CARD
  // ============================================================
  Widget _buildLanguageCard({
    required int index,
    required String primaryLabel,
    required String secondaryLabel,
  }) {
    final bool isSelected = _selectedLanguageIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedLanguageIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F5E9) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryAppColor
                : const Color(0xFFE0E0E0),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            // Primary language
            Text(
              primaryLabel,
              style: TextStyle(
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: AppColors.primaryTextColor,
              ),
            ),

            // Secondary language
            if (secondaryLabel.isNotEmpty) ...[
              const SizedBox(width: 8),
              Text(
                secondaryLabel,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],

            const Spacer(),

            // Selected / unselected indicator
            if (isSelected)
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: AppColors.primaryAppColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 14),
              )
            else
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade400, width: 1.5),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
