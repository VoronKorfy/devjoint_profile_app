import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:devjoint_profile_app/models/onboarding_page.dart';
import 'package:devjoint_profile_app/widgets/onboarding_item.dart';
import 'package:devjoint_profile_app/widgets/page_indicator.dart';
import 'package:devjoint_profile_app/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  late final ValueNotifier<int> _currentPageNotifier;

  final List<OnboardingPage> _pages = const [
    OnboardingPage(
      title: 'Manage your profile easily',
      description:
      'All your information in one place. Keep track and update anytime.',
    ),
    OnboardingPage(
      title: 'Showcase Your Work',
      description:
      'Build an impressive profile and highlight your latest Flutter apps.',
    ),
    OnboardingPage(
      title: 'Stay Updated',
      description:
      'Customize your settings, preferences, and notifications effortlessly.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPageNotifier = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  void _onNext(BuildContext context) {
    if (_currentPageNotifier.value < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.go('/profile'),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xFF6C5CE7),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  _currentPageNotifier.value = index;
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return OnboardingItem(item: _pages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
              child: ValueListenableBuilder<int>(
                valueListenable: _currentPageNotifier,
                builder: (context, currentPage, child) {
                  return Column(
                    children: [
                      PageIndicator(
                        count: _pages.length,
                        currentIndex: currentPage,
                      ),
                      const SizedBox(height: 32),
                      CustomButton(
                        text: currentPage == _pages.length - 1
                            ? 'Get Started'
                            : 'Continue',
                        showArrow: true,
                        onPressed: () => _onNext(context),
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}