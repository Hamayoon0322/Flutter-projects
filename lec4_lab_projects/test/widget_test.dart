import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lec4_lab_projects/main.dart';

void main() {
  testWidgets('Six labs open and interactive examples work', (tester) async {
    await tester.pumpWidget(const LabApp());
    for (var number = 1; number <= 6; number++) {
      final tile = find.textContaining('Lab $number -');
      await tester.ensureVisible(tile);
      await tester.tap(tile);
      await tester.pumpAndSettle();
      expect(find.byType(SelectableText), findsWidgets);
      if (number == 3) {
        await tester.tap(find.text('Named callback'));
        await tester.pump();
        expect(find.text('Named callback clicks: 1'), findsOneWidget);
        await tester.tap(find.text('Anonymous callback'));
        await tester.pump();
        expect(find.text('Anonymous callback clicks: 1'), findsOneWidget);
      }
      if (number == 5) {
        await tester.tap(find.text('Deposit \$25'));
        await tester.pump();
        expect(find.text('Balance through getter: \$125.00'), findsOneWidget);
      }
      await tester.pageBack();
      await tester.pumpAndSettle();
    }
  });
}
