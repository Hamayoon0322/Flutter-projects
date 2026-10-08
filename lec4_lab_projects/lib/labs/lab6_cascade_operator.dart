import 'package:flutter/material.dart';
import 'lab_output.dart';

class StudentProfile {
  String name = '';
  int semester = 1;
  String department = '';
  final List<String> courses = [];
  void addCourse(String course) => courses.add(course);
  @override
  String toString() =>
      '$name | Semester: $semester | $department | Courses: $courses';
}

List<String> runLab6() {
  final ordinary = StudentProfile();
  ordinary.name = 'Sara';
  ordinary.semester = 3;
  ordinary.department = 'Computer Science';
  ordinary.addCourse('Mobile Development');

  final cascaded = StudentProfile()
    ..name = 'Sara'
    ..semester = 3
    ..department = 'Computer Science'
    ..addCourse('Mobile Development');
  return [
    'Ordinary statements: $ordinary',
    'Cascade statements: $cascaded',
    'Same result: ${ordinary.toString() == cascaded.toString()}',
    'Cascades group configuration of one object and return the original object. Even though addCourse() returns void, the cascade still targets the profile.',
    'Use cascades for short setup sequences. Ordinary statements are clearer when operations need branching, different targets, or returned values. Long cascades can reduce readability.',
  ];
}

class Lab6Page extends StatelessWidget {
  const Lab6Page({super.key});
  @override
  Widget build(BuildContext context) =>
      LabOutput(title: 'Lab 6 - Cascade Operator', lines: runLab6());
}
