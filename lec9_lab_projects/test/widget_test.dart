import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lec9_lab_projects/main.dart';

void main() {
  testWidgets('Stack navigation opens details and returns home', (
    tester,
  ) async {
    await tester.pumpWidget(const LectureNineApp());

    await tester.tap(find.text('Practical Lab 1 - Stack Navigation'));
    await tester.pumpAndSettle();
    expect(find.text('Lab 1 - Home'), findsOneWidget);

    await tester.tap(find.text('Open details'));
    await tester.pumpAndSettle();
    expect(find.text('Lab 1 - Details'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Lab 1 - Home'), findsOneWidget);
  });

  testWidgets('Product and department data pass between routes', (
    tester,
  ) async {
    await tester.pumpWidget(const LectureNineApp());

    await tester.tap(find.text('Practical Lab 2 - Passing Data'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Wireless Headphones'));
    await tester.pumpAndSettle();
    expect(find.text('Product ID: P-101'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Practical Lab 3 - Returning a Result'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Choose department'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Data Science'));
    await tester.pumpAndSettle();
    expect(find.text('Data Science'), findsOneWidget);
  });

  testWidgets('Portal login resets its route and profile returns an update', (
    tester,
  ) async {
    await tester.pumpWidget(const LectureNineApp());

    await tester.tap(find.text('Mini Project - Student Portal Navigation'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue to dashboard'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome, Alex Morgan'), findsOneWidget);

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Edit profile'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Taylor Morgan');
    await tester.tap(find.text('Save changes'));
    await tester.pumpAndSettle();

    expect(find.text('Taylor Morgan'), findsOneWidget);
  });
}
