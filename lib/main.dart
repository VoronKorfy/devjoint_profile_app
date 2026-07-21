import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:devjoint_profile_app/screens/onboarding_screen.dart';
import 'package:devjoint_profile_app/screens/profile_screen.dart';
import 'package:devjoint_profile_app/screens/settings_screen.dart';
import 'package:devjoint_profile_app/screens/edit_profile_screen.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => OnboardingScreen()),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) => const EditProfileScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, currentMode, _) {
        return MaterialApp.router(
          title: 'DevJoint Profile App',
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0xFFF8F9FE),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF6C5CE7),
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF121212),
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF6C5CE7),
              surface: Color(0xFF1E1E1E),
              onSurface: Colors.white,
            ),
            useMaterial3: true,
          ),
          routerConfig: _router,
        );
      },
    );
  }
}
