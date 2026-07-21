import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:devjoint_profile_app/main.dart';
import 'package:devjoint_profile_app/widgets/settings_switch_tile.dart';
import 'package:devjoint_profile_app/widgets/settings_list_tile.dart';
import 'package:devjoint_profile_app/widgets/settings_section_header.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // simple local state for notification toggles
  bool pushNotifications = true;
  bool emailNotifications = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          children: [
            // preferences block
            const SettingsSectionHeader(title: 'PREFERENCES'),
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  SettingsSwitchTile(
                    icon: Icons.notifications_none_outlined,
                    title: 'Push Notifications',
                    value: pushNotifications,
                    onChanged: (val) => setState(() => pushNotifications = val),
                  ),
                  SettingsSwitchTile(
                    icon: Icons.email_outlined,
                    title: 'Email Notifications',
                    value: emailNotifications,
                    onChanged: (val) =>
                        setState(() => emailNotifications = val),
                  ),
                  SettingsSwitchTile(
                    icon: Icons.dark_mode_outlined,
                    title: 'Dark Mode',
                    value: isDarkMode,
                    onChanged: (val) {
                      setState(() {
                        themeNotifier.value = val
                            ? ThemeMode.dark
                            : ThemeMode.light;
                      });
                    },
                  ),
                  SettingsListTile(
                    icon: Icons.language,
                    title: 'Language',
                    trailingText: 'English',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // account section
            const SettingsSectionHeader(title: 'ACCOUNT'),
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  SettingsListTile(
                    icon: Icons.lock_outline,
                    title: 'Privacy',
                    onTap: () {},
                  ),
                  SettingsListTile(
                    icon: Icons.security_outlined,
                    title: 'Security',
                    onTap: () {},
                  ),
                  SettingsListTile(
                    icon: Icons.person_off_outlined,
                    title: 'Blocked Users',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // extra options and logout
            const SettingsSectionHeader(title: 'MORE'),
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  SettingsListTile(
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    onTap: () {},
                  ),
                  SettingsListTile(
                    icon: Icons.info_outline,
                    title: 'About App',
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    onTap: () => context.go('/'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
