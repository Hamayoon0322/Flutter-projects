import 'package:flutter_test/flutter_test.dart';

import 'package:first_app/main.dart';

void main() {
  testWidgets('Student profile biography can be shown and hidden', (
    WidgetTester tester,
  ) async {
    // Build the app and check the initial student details.
    await tester.pumpWidget(const MyApp());

    expect(find.text('Student Name: Hamayoon Jan'), findsOneWidget);
    expect(find.text('Department: Software Engineering'), findsOneWidget);
    expect(find.text('Semester: 7th Semester'), findsOneWidget);
    expect(
      find.text(
        'I am a Software Engineering student interested in learning software development and Flutter.',
      ),
      findsOneWidget,
    );

    // Press the button to hide the biography.
    await tester.tap(find.text('Show/Hide Biography'));
    await tester.pump();

    expect(find.text('Biography hidden'), findsOneWidget);

    // Press the same button again to show it.
    await tester.tap(find.text('Show/Hide Biography'));
    await tester.pump();

    expect(
      find.text(
        'I am a Software Engineering student interested in learning software development and Flutter.',
      ),
      findsOneWidget,
    );
  });
}
