import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lec5_lab_projects/main.dart';

void main() {
  for (final width in [320.0, 1000.0]) {
    testWidgets('All labs render at width $width and alignment controls work', (
      tester,
    ) async {
      tester.view.physicalSize = Size(width, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const LabApp());
      for (var number = 1; number <= 4; number++) {
        await tester.tap(find.textContaining('Lab $number -'));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        if (number == 3) {
          await tester.tap(
            find.byType(DropdownButtonFormField<MainAxisAlignment>),
          );
          await tester.pumpAndSettle();
          await tester.tap(find.text('spaceBetween').last);
          await tester.pumpAndSettle();
          await tester.tap(
            find.byType(DropdownButtonFormField<CrossAxisAlignment>),
          );
          await tester.pumpAndSettle();
          await tester.tap(find.text('stretch').last);
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
        }
        await tester.pageBack();
        await tester.pumpAndSettle();
      }
    });
  }
}
