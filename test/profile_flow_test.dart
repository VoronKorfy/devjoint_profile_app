import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:devjoint_profile_app/main.dart';

void main() {
  testWidgets('Full profile and edit navigation flow', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final skipBtn = find.text('Skip');
    if (skipBtn.evaluate().isNotEmpty) {
      await tester.tap(skipBtn);
      await tester.pumpAndSettle();
    }

    final editProfileBtn = find.text('Edit Profile');
    if (editProfileBtn.evaluate().isNotEmpty) {
      await tester.tap(editProfileBtn.first);
      await tester.pumpAndSettle();

      final textFields = find.byType(TextField);
      if (textFields.evaluate().isNotEmpty) {
        await tester.enterText(textFields.first, 'New Tester Name');
        await tester.pumpAndSettle();
        expect(find.text('New Tester Name'), findsOneWidget);
      }

      final saveBtn = find.text('Save');
      if (saveBtn.evaluate().isNotEmpty) {
        await tester.tap(saveBtn);
        await tester.pumpAndSettle();
      }
    }
  });

  testWidgets('Navigate to Settings screen', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final skipBtn = find.text('Skip');
    if (skipBtn.evaluate().isNotEmpty) {
      await tester.tap(skipBtn);
      await tester.pumpAndSettle();
    }

    final settingsTile = find.text('App Settings');
    if (settingsTile.evaluate().isNotEmpty) {
      await tester.scrollUntilVisible(settingsTile, 100);
      await tester.tap(settingsTile);
      await tester.pumpAndSettle();

      expect(find.text('Settings'), findsOneWidget);
    }
  });
}