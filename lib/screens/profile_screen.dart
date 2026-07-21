import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:devjoint_profile_app/models/user_profile.dart';
import 'package:devjoint_profile_app/widgets/custom_button.dart';
import 'package:devjoint_profile_app/widgets/stat_card.dart';
import 'package:devjoint_profile_app/widgets/profile_menu_item.dart';
import 'package:devjoint_profile_app/widgets/user_header_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // mock data for presentation
  static const mockUser = UserProfile(
    name: 'FuadEliyevFlutterDeveloper2026SuperLongUsername',
    email:
        'fuad.eliyev.flutter.mobile.super.long.idk.what.to.write.lol.developer@gmail.com',
    phone: '+994 50 123 45 67',
    bio:
        'Passionate Flutter developer who loves building beautiful and functional apps.',
    avatarUrl: '',
    projectsCount: 24,
    likesCount: 128,
    badgesCount: 7,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top header with title and bell icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.notifications_none_outlined,
                        color: theme.colorScheme.onSurface,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // user profile card
                const UserHeaderCard(user: mockUser),
                const SizedBox(height: 20),

                // stats section using layoutbuilder for adaptability
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            label: 'Projects',
                            value: mockUser.projectsCount.toString(),
                            icon: Icons.people_outline,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: StatCard(
                            label: 'Likes',
                            value: mockUser.likesCount.toString(),
                            icon: Icons.favorite_border,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: StatCard(
                            label: 'Badges',
                            value: mockUser.badgesCount.toString(),
                            icon: Icons.star_border,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),

                // menu label
                const Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 12),

                // options list container
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ProfileMenuItem(
                        icon: Icons.assignment_outlined,
                        title: 'My Activity',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.bookmark_border,
                        title: 'Saved Items',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.folder_outlined,
                        title: 'My Projects',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.email_outlined,
                        title: 'Messages',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.notifications_none_outlined,
                        title: 'Notifications',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.security_outlined,
                        title: 'Privacy & Security',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.help_outline,
                        title: 'Help & Support',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.info_outline,
                        title: 'About App',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.settings_outlined,
                        title: 'App Settings',
                        onTap: () => context.push('/settings'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // logout action
                CustomButton(text: 'Log Out', onPressed: () => context.go('/')),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      // bottom bar matching design specification
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF6C5CE7),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40, color: Color(0xFF6C5CE7)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Messages',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
