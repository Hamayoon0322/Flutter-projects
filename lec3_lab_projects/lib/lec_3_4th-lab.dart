// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Student {
  final String name;
  final String department;
  final int semester;

  const Student({
    required this.name,
    required this.department,
    required this.semester,
  });

  String displayInfo() {
    return '$name - $department - Semester $semester';
  }
}

void main() {
  runApp(const FourthLabApp());
}

class FourthLabApp extends StatelessWidget {
  const FourthLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    final students = <Student>[
      const Student(name: 'Ahmad', department: 'Computer Science', semester: 4),
      const Student(
        name: 'Sara',
        department: 'Information Technology',
        semester: 3,
      ),
      const Student(
        name: 'Omar',
        department: 'Software Engineering',
        semester: 5,
      ),
    ];
    final studentInfo = <String>[];

    for (final student in students) {
      studentInfo.add(student.displayInfo());
    }

    return MaterialApp(
      title: 'Fourth Lab',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
      home: Scaffold(
        appBar: AppBar(title: const Text('Fourth Lab: Students')),
        body: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: studentInfo.length,
          separatorBuilder: (_, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(studentInfo[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
