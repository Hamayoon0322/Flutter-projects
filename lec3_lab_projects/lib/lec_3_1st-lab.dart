// ignore_for_file: file_names

import 'package:flutter/material.dart';

const String studentName = 'Ahmad';
const int age = 22;
const int semester = 4;
const List<double> marks = [85, 85, 85, 85, 85];
const double gpa = 4.5;
const bool status = true;

void main() {
  runApp(const StudentLabApp());
}

class StudentLabApp extends StatelessWidget {
  const StudentLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    final markAverage =
        marks.reduce((first, second) => first + second) / marks.length;

    return MaterialApp(
      title: 'Student Lab',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.indigo)),
      home: Scaffold(
        appBar: AppBar(title: const Text('Student Lab')),
        body: Center(
          child: Card(
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    studentName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text('Age: $age'),
                  Text('Semester: $semester'),
                  Text('Average marks: ${markAverage.toStringAsFixed(1)}'),
                  Text('GPA: $gpa'),
                  Text('Status: ${status ? 'Active' : 'Inactive'}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
