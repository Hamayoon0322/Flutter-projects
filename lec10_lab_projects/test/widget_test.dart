import 'package:flutter_test/flutter_test.dart';
import 'package:lec10_lab_projects/main.dart';

void main() {
  testWidgets('Lab launcher opens AnimatedContainer demo', (tester) async {
    await tester.pumpWidget(const LectureTenApp());

    await tester.tap(find.text('Practical Lab 1 - AnimatedContainer'));
    await tester.pumpAndSettle();
    expect(find.text('Lab 1 - AnimatedContainer'), findsOneWidget);

    await tester.tap(find.text('Animate shape'));
    await tester.pump(const Duration(milliseconds: 450));
    await tester.pumpAndSettle();
    expect(find.text('Return to square'), findsOneWidget);
  });

  testWidgets('Opacity and crossfade controls change their states', (
    tester,
  ) async {
    await tester.pumpWidget(const LectureTenApp());

    await tester.tap(find.text('Practical Lab 2 - Opacity & CrossFade'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Fade out profile'));
    await tester.pumpAndSettle();
    expect(find.text('Jordan Lee'), findsOneWidget);
    await tester.tap(find.text('Unlock content'));
    await tester.pumpAndSettle();
    expect(find.text('Unlocked'), findsOneWidget);
  });

  testWidgets('AnimatedBuilder repeat can be stopped', (tester) async {
    await tester.pumpWidget(const LectureTenApp());

    await tester.tap(find.text('Practical Lab 4 - AnimatedBuilder'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Repeat'));
    await tester.pump(const Duration(milliseconds: 300));
    await tester.tap(find.text('Stop'));
    await tester.pump();
    expect(find.text('Forward'), findsOneWidget);
  });

  testWidgets('Onboarding animation continues to the completion page', (
    tester,
  ) async {
    await tester.pumpWidget(const LectureTenApp());

    await tester.tap(find.text('Mini Project - Animated Onboarding'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('Let’s get started!'), findsOneWidget);
  });
}
