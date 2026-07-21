import 'package:flutter/material.dart';

// simple tile for navigation items inside settings
class SettingsListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;
  final VoidCallback onTap;

  const SettingsListTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailingText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      dense: true,
      leading: Icon(icon, color: theme.colorScheme.onSurface, size: 20),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.onSurface,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText!,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          const SizedBox(width: 4),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
      onTap: onTap,
    );
  }
}
