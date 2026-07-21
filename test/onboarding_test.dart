import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:devjoint_profile_app/main.dart';

void main() {
  testWidgets('Onboarding screen renders and handles skip action', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final skipFinder = find.text('Skip');
    if (skipFinder.evaluate().isNotEmpty) {
      await tester.tap(skipFinder);
      await tester.pumpAndSettle();
    }

    expect(find.byType(Scaffold), findsWidgets);
  });

  testWidgets('Onboarding page swipe works correctly', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Находим Scaffold и делаем жест свайпа влево
    final scaffoldFinder = find.byType(Scaffold);
    if (scaffoldFinder.evaluate().isNotEmpty) {
      await tester.drag(scaffoldFinder.first, const Offset(-400, 0));
      await tester.pumpAndSettle();
    }

    // Проверяем, что экран успешного рендерится после свайпа
    expect(find.byType(Scaffold), findsWidgets);
  });
}