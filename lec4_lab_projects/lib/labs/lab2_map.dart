import 'package:flutter/material.dart';
import 'lab_output.dart';

class Student {
  final String name;
  final int id;
  final int semester;
  final String department;
  final Map<String, String> address;
  Student.fromMap(Map<String, Object> map)
    : name = map['name'] as String,
      id = map['id'] as int,
      semester = map['semester'] as int,
      department = map['department'] as String,
      address = Map<String, String>.from(map['address'] as Map);
  @override
  String toString() =>
      '$name (ID: $id), semester $semester, $department, address: $address';
}

List<String> runLab2() {
  final studentMap = <String, Object>{
    'name': 'Ahmad',
    'id': 104,
    'semester': 2,
    'department': 'Computer Science',
  };
  final output = [
    'Original map: $studentMap',
    'Read name: ${studentMap['name']}',
  ];
  studentMap['semester'] = 3;
  output.add('Updated semester: ${studentMap['semester']}');
  studentMap['email'] = 'ahmad@example.com';
  output.add('Added email: ${studentMap['email']}');
  studentMap.remove('email');
  output.add('Removed email: $studentMap');
  studentMap['address'] = <String, String>{
    'city': 'Kabul',
    'country': 'Afghanistan',
  };
  for (final entry in studentMap.entries) {
    output.add('${entry.key}: ${entry.value}');
  }
  final student = Student.fromMap(studentMap);
  output.add('Student.fromMap: $student');
  return output;
}

class Lab2Page extends StatelessWidget {
  const Lab2Page({super.key});
  @override
  Widget build(BuildContext context) =>
      LabOutput(title: 'Lab 2 - Map', lines: runLab2());
}
