import 'package:flutter/material.dart';

import 'labs/lab1_stack_navigation.dart';
import 'labs/lab2_passing_data.dart';
import 'labs/lab3_returning_result.dart';
import 'labs/lab4_drawer.dart';
import 'labs/lab5_tabs.dart';
import 'mini_project/student_portal.dart';

void main() => runApp(const LectureNineApp());

class LectureNineApp extends StatelessWidget {
  const LectureNineApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Lecture 9 Navigation Labs',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      useMaterial3: true,
    ),
    home: const LabHomePage(),
  );
}

class LabHomePage extends StatelessWidget {
  const LabHomePage({super.key});

  static const _labs = <({String title, IconData icon, Widget page})>[
    (
      title: 'Practical Lab 1 - Stack Navigation',
      icon: Icons.layers_outlined,
      page: Lab1HomePage(),
    ),
    (
      title: 'Practical Lab 2 - Passing Data',
      icon: Icons.inventory_2_outlined,
      page: Lab2ProductListPage(),
    ),
    (
      title: 'Practical Lab 3 - Returning a Result',
      icon: Icons.assignment_turned_in_outlined,
      page: Lab3HomePage(),
    ),
    (
      title: 'Practical Lab 4 - Drawer',
      icon: Icons.menu,
      page: Lab4HomePage(),
    ),
    (
      title: 'Practical Lab 5 - Tabs',
      icon: Icons.tab,
      page: Lab5CoursesPage(),
    ),
  ];

  void _openPage(BuildContext context, Widget page) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lecture 9 - Navigation & Routing')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Practical labs',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        for (final lab in _labs)
          Card(
            child: ListTile(
              leading: Icon(lab.icon),
              title: Text(lab.title),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _openPage(context, lab.page),
            ),
          ),
        const SizedBox(height: 16),
        Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: ListTile(
            leading: const Icon(Icons.school_outlined),
            title: const Text('Mini Project - Student Portal Navigation'),
            subtitle: const Text('Login, courses, profile and settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _openPage(context, const StudentPortalLoginPage()),
          ),
        ),
      ],
    ),
  );
}
