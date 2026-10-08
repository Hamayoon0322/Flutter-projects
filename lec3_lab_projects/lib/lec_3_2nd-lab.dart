// ignore_for_file: file_names

import 'package:flutter/material.dart';

const double mark = 78;

String getGrade(double mark) {
  if (mark >= 90) {
    return 'A';
  } else if (mark >= 80) {
    return 'B';
  } else if (mark >= 70) {
    return 'C';
  } else if (mark >= 60) {
    return 'D';
  }
  return 'F';
}

List<int> numbersOneToTwenty() {
  final numbers = <int>[];
  for (var number = 1; number <= 20; number++) {
    numbers.add(number);
  }
  return numbers;
}

List<int> evenNumbersOneToTwenty() {
  final evenNumbers = <int>[];
  for (final number in numbersOneToTwenty()) {
    if (number.isEven) {
      evenNumbers.add(number);
    }
  }
  return evenNumbers;
}

List<int> whileLoopNumbers() {
  final numbers = <int>[];
  var number = 1;
  while (number <= 5) {
    numbers.add(number);
    number++;
  }
  return numbers;
}

void main() {
  runApp(const SecondLabApp());
}

class SecondLabApp extends StatelessWidget {
  const SecondLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    final grade = getGrade(mark);
    final result = mark >= 60 ? 'Pass' : 'Fail';
    final status = result == 'Pass' ? 'Student passed' : 'Student failed';

    return MaterialApp(
      title: 'Second Lab',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.teal)),
      home: Scaffold(
        appBar: AppBar(title: const Text('Second Lab: Conditions and Loops')),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text('Mark: $mark', style: Theme.of(context).textTheme.titleLarge),
            Text('Result: $result'),
            Text('Letter grade: $grade'),
            Text('Ternary status: $status'),
            const Divider(height: 32),
            Text('For loop, numbers 1-20: ${numbersOneToTwenty().join(', ')}'),
            const SizedBox(height: 8),
            Text('Even numbers only: ${evenNumbersOneToTwenty().join(', ')}'),
            const SizedBox(height: 8),
            Text('While loop: ${whileLoopNumbers().join(', ')}'),
          ],
        ),
      ),
    );
  }
}
