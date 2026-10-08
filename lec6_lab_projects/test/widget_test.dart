import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lec6_lab_projects/main.dart';
import 'package:lec6_lab_projects/labs/lab1_buttons.dart';
import 'package:lec6_lab_projects/labs/lab2_images_icons.dart';
import 'package:lec6_lab_projects/labs/lab3_asset_bundle.dart';
import 'package:lec6_lab_projects/labs/lab4_validated_form.dart';

void main() {
  testWidgets('Menu contains all four labs', (tester) async {
    await tester.pumpWidget(const LabApp());
    for (var i = 1; i <= 4; i++) {
      expect(find.textContaining('Lab $i -'), findsOneWidget);
    }
  });

  testWidgets('Buttons, conditional disabling, menu and FAB work', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Lab1Page()));
    await tester.tap(find.text('Save'));
    await tester.pump();
    expect(find.text('Saved successfully'), findsOneWidget);
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(
      tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
      isNull,
    );
    await tester.tap(find.byTooltip('Add favorite'));
    await tester.pump();
    expect(find.text('Added to favorites'), findsOneWidget);
    await tester.tap(find.byTooltip('Add item'));
    await tester.pump();
    expect(find.text('Items added: 1'), findsOneWidget);
    await tester.tap(find.byTooltip('More actions'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    expect(find.text('Settings selected'), findsOneWidget);
  });

  testWidgets('Registered image decodes and network errors show fallback', (
    tester,
  ) async {
    final bytes = await rootBundle.load('assets/images/flutter.png');
    expect(bytes.lengthInBytes, greaterThan(0));
    await tester.pumpWidget(const MaterialApp(home: Lab2Page()));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Unavailable image'), 180);
    await tester.pumpAndSettle();
    expect(find.text('Image unavailable'), findsWidgets);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Asset text loads and is displayed', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Lab3Page()));
    await tester.runAsync(() async {
      await rootBundle.loadString('assets/data/info.txt');
    });
    await tester.pumpAndSettle();
    expect(
      find.textContaining('Lecture 6 - Common Widgets II'),
      findsOneWidget,
    );
  });

  for (final width in [320.0, 1000.0]) {
    testWidgets('Form validates, submits and resets at width $width', (
      tester,
    ) async {
      tester.view.physicalSize = Size(width, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const MaterialApp(home: Lab4Page()));
      await tester.tap(find.text('Submit'));
      await tester.pumpAndSettle();
      expect(find.text('Enter your name'), findsOneWidget);
      expect(find.text('Enter a valid email address'), findsOneWidget);
      expect(find.text('Use at least 8 characters'), findsOneWidget);
      final fields = find.byType(TextFormField);
      await tester.enterText(fields.at(0), 'Ahmad');
      await tester.enterText(fields.at(1), 'invalid');
      await tester.enterText(fields.at(2), '123');
      await tester.ensureVisible(find.text('Submit'));
      await tester.tap(find.text('Submit'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Submitted successfully'), findsNothing);
      await tester.enterText(fields.at(1), 'ahmad@example.com');
      await tester.enterText(fields.at(2), 'example123');
      await tester.ensureVisible(find.text('Submit'));
      await tester.tap(find.text('Submit'));
      await tester.pumpAndSettle();
      expect(find.text('Submitted successfully for Ahmad'), findsOneWidget);
      await tester.ensureVisible(find.text('Reset'));
      await tester.tap(find.text('Reset'));
      await tester.pumpAndSettle();
      for (final field in tester.widgetList<TextFormField>(fields)) {
        expect(field.controller!.text, isEmpty);
      }
      expect(find.textContaining('Submitted successfully'), findsNothing);
      expect(find.text('Enter your name'), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }
}
