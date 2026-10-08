import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lec7_lab_projects/main.dart';
import 'package:lec7_lab_projects/labs/lab1_tap_double_tap.dart';
import 'package:lec7_lab_projects/labs/lab2_long_press.dart';
import 'package:lec7_lab_projects/labs/lab3_drag.dart';
import 'package:lec7_lab_projects/labs/lab4_swipe.dart';
import 'package:lec7_lab_projects/labs/lab5_pinch_zoom.dart';

void main() {
  testWidgets('Five labs are available', (tester) async {
    await tester.pumpWidget(const LabApp());
    expect(find.byType(ListTile), findsNWidgets(5));
  });
  testWidgets('Tap changes color and double tap toggles favorite', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Lab1Page()));
    final box = find.byKey(const Key('gesture-box'));
    final before = tester
        .widget<Container>(
          find.descendant(of: box, matching: find.byType(Container)),
        )
        .color;
    await tester.tap(box);
    await tester.pump(const Duration(milliseconds: 350));
    final after = tester
        .widget<Container>(
          find.descendant(of: box, matching: find.byType(Container)),
        )
        .color;
    expect(after, isNot(before));
    await tester.tap(box);
    await tester.pump(const Duration(milliseconds: 50));
    await tester.tap(box);
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
  testWidgets('Long press and visible action open the same menu', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Lab2Page()));
    await tester.longPress(find.text('Mobile Development'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add favorite'));
    await tester.pumpAndSettle();
    expect(find.text('Added to favorites'), findsOneWidget);
    await tester.tap(find.byTooltip('Open actions'));
    await tester.pumpAndSettle();
    expect(find.text('Remove favorite'), findsOneWidget);
  });
  testWidgets('Drag remains in bounds and reset restores origin', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Lab3Page()));
    final square = find.byKey(const Key('drag-square'));
    final area = find.byKey(const Key('drag-area'));
    await tester.drag(square, const Offset(900, 900));
    await tester.pump();
    final rect = tester.getRect(square);
    final boundary = tester.getRect(area);
    expect(rect.right, lessThanOrEqualTo(boundary.right + 0.1));
    expect(rect.bottom, lessThanOrEqualTo(boundary.bottom + 0.1));
    await tester.tap(find.text('Reset'));
    await tester.pump();
    expect(tester.getTopLeft(square), boundary.topLeft);
  });
  testWidgets('Swipe cancels below threshold, deletes and undoes', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Lab4Page()));
    final card = find.byKey(const Key('swipe-card'));
    await tester.drag(card, const Offset(45, 0));
    await tester.pumpAndSettle();
    expect(card, findsOneWidget);
    await tester.drag(card, const Offset(-220, 0));
    await tester.pumpAndSettle();
    expect(find.text('Left swipe - item deleted'), findsOneWidget);
    await tester.tap(find.text('Undo'));
    await tester.pumpAndSettle();
    expect(card, findsOneWidget);
  });
  testWidgets('Two pointer pinch zooms and reset restores scale', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Lab5Page()));
    await tester.pumpAndSettle();
    final center = tester.getCenter(find.byKey(const Key('custom-zoom')));
    final left = await tester.startGesture(
      center - const Offset(40, 0),
      pointer: 1,
    );
    final right = await tester.startGesture(
      center + const Offset(40, 0),
      pointer: 2,
    );
    await tester.pump();
    await left.moveTo(center - const Offset(120, 0));
    await right.moveTo(center + const Offset(120, 0));
    await tester.pump();
    await left.moveTo(center - const Offset(180, 0));
    await right.moveTo(center + const Offset(180, 0));
    await tester.pump();
    await left.up();
    await right.up();
    await tester.pumpAndSettle();
    expect(find.text('Zoom: 1.00x'), findsNothing);
    await tester.tap(find.text('Reset'));
    await tester.pump();
    expect(find.text('Zoom: 1.00x'), findsOneWidget);
    await tester.tap(find.text('InteractiveViewer'));
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<InteractiveViewer>(find.byType(InteractiveViewer))
          .panEnabled,
      isTrue,
    );
    expect(tester.takeException(), isNull);
  });
}
