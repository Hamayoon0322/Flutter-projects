import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_profile/main.dart';

void main() {
  for (final width in [320.0, 1000.0]) {
    testWidgets('Profile edit, validation and courses work at $width', (
      tester,
    ) async {
      tester.view.physicalSize = Size(width, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const StudentProfileApp());
      expect(find.text('Ahmad Mohammad'), findsOneWidget);
      await tester.tap(find.byTooltip('Edit profile'));
      await tester.pumpAndSettle();
      final fields = find.byType(TextFormField);
      await tester.enterText(fields.at(0), '');
      await tester.ensureVisible(find.text('Save changes'));
      await tester.tap(find.text('Save changes'));
      await tester.pumpAndSettle();
      expect(find.text('Enter Name'), findsOneWidget);
      await tester.ensureVisible(fields.at(0));
      await tester.enterText(fields.at(0), 'Sara Ahmad');
      await tester.ensureVisible(find.text('Save changes'));
      await tester.tap(find.text('Save changes'));
      await tester.pumpAndSettle();
      expect(find.text('Sara Ahmad'), findsOneWidget);
      await tester.tap(find.text('Courses'));
      await tester.pumpAndSettle();
      expect(find.text('Advanced Mobile Programming'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
