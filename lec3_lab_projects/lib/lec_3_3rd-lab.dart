// ignore_for_file: file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const ThirdLabApp());
}

class ThirdLabApp extends StatelessWidget {
  const ThirdLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      'Programming Fundamentals',
      'Database Systems',
      'Web Development',
      'Flutter',
      'Computer Networks',
    ];
    final firstCourse = courses.first;
    final lastCourse = courses.last;

    courses.add('Mobile App Development');
    courses.remove('Database Systems');

    final flutterExists = courses.contains('Flutter');
    final courseLines = <String>[];
    for (final course in courses) {
      courseLines.add(course);
    }

    final marks = [85, 78, 92, 88, 95];
    final average = marks.reduce((total, mark) => total + mark) / marks.length;

    return MaterialApp(
      title: 'Third Lab',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.orange)),
      home: Scaffold(
        appBar: AppBar(title: const Text('Third Lab: Lists')),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text('First course: $firstCourse'),
            Text('Last course: $lastCourse'),
            Text('Flutter exists: $flutterExists'),
            const Divider(height: 32),
            const Text('Courses after adding and removing:'),
            ...courseLines.map(Text.new),
            const Divider(height: 32),
            Text('Marks: ${marks.join(', ')}'),
            Text('Average mark: ${average.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
