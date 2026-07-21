import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:devjoint_profile_app/models/user_profile.dart';

// main user card displaying avatar, email and edit button
class UserHeaderCard extends StatelessWidget {
  final UserProfile user;

  const UserHeaderCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // avatar placeholder
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark
                      ? const Color(0xFF2D2B4A)
                      : const Color(0xFFE8E5FF),
                  border: Border.all(
                    color: const Color(0xFF6C5CE7),
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  size: 40,
                  color: Color(0xFF6C5CE7),
                ),
              ),
              const SizedBox(width: 16),
              // username and email overflow handling
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      user.email,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark
                            ? Colors.grey.shade400
                            : Colors.grey.shade600,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // navigation to edit screen
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton.icon(
              onPressed: () => context.push('/edit-profile'),
              style: OutlinedButton.styleFrom(
                backgroundColor: isDark
                    ? const Color(0xFF2D2B4A)
                    : const Color(0xFFF3F0FF),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              label: const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6C5CE7),
                  fontWeight: FontWeight.w600,
                ),
              ),
              icon: const Icon(
                Icons.edit_outlined,
                size: 14,
                color: Color(0xFF6C5CE7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
