import 'package:flutter/material.dart';

// custom switch tile for toggles like dark mode or notifications
class SettingsSwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsSwitchTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SwitchListTile(
      dense: true,
      activeThumbColor: const Color(0xFF6C5CE7),
      secondary: Icon(icon, color: theme.colorScheme.onSurface, size: 20),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.onSurface,
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
