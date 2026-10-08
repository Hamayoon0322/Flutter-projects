import 'package:flutter/material.dart';
import 'lab_output.dart';

int add(int a, int b) {
  return a + b;
}

int square(int number) => number * number;
int applyOperation(int value, int Function(int) operation) => operation(value);

List<String> runLab3() {
  final int Function(int, int) operation = add;
  final numbers = [1, 2, 3, 4];
  final doubled = numbers.map((number) => number * 2).toList();
  return [
    'Normal function add(3, 4): ${add(3, 4)}',
    'Fat-arrow function square(5): ${square(5)}',
    'Function assigned to variable: ${operation(10, 20)}',
    'Pass function to another: ${applyOperation(6, square)}',
    'Anonymous function: ${applyOperation(8, (value) => value + 1)}',
    'map() transforms $numbers into $doubled',
  ];
}

class Lab3Page extends StatefulWidget {
  const Lab3Page({super.key});
  @override
  State<Lab3Page> createState() => _Lab3PageState();
}

class _Lab3PageState extends State<Lab3Page> {
  int namedClicks = 0;
  int anonymousClicks = 0;
  void onNamedPressed() => setState(() => namedClicks++);
  @override
  Widget build(BuildContext context) => LabOutput(
    title: 'Lab 3 - Functions',
    lines: [
      ...runLab3(),
      'Named callback clicks: $namedClicks',
      'Anonymous callback clicks: $anonymousClicks',
    ],
    actions: [
      ElevatedButton(
        onPressed: onNamedPressed,
        child: const Text('Named callback'),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() => anonymousClicks++);
        },
        child: const Text('Anonymous callback'),
      ),
    ],
  );
}
