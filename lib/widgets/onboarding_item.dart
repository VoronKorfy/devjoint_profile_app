import 'package:flutter/material.dart';
import 'package:devjoint_profile_app/models/onboarding_page.dart';

// widget for a single onboarding slide
class OnboardingItem extends StatelessWidget {
  final OnboardingPage item;

  const OnboardingItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/onboarding_img.png',
              height: 220,
              width: double.infinity,
              fit: BoxFit.contain,
              // fallback container if asset is missing
              errorBuilder: (context, error, stackTrace) => Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF2D2B4A)
                      : const Color(0xFFE8E5FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.image_outlined,
                  size: 60,
                  color: Color(0xFF6C5CE7),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
