import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StudentProfilePage(),
    );
  }
}

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  bool _showBiography = true;

  void _toggleBiography() {
    setState(() {
      _showBiography = !_showBiography;
    });
  }

  // url_launcher is used here to open a simple student website link.
  Future<void> _openWebsite() async {
    final Uri url = Uri.parse('https://example.com');
    if (!await launchUrl(url)) {
      throw Exception('Could not open the website');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const StudentInfo(
              studentName: 'Hamayoon Jan',
              department: 'Software Engineering',
              semester: '7th Semester',
            ),
            const SizedBox(height: 20),
            if (_showBiography)
              Theme(
                data: Theme.of(context).copyWith(
                  textTheme: Theme.of(context).textTheme.copyWith(
                    bodyMedium: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                child: const Text(
                  'I am a Software Engineering student interested in learning software development and Flutter.',
                  style: TextStyle(fontSize: 16),
                ),
              )
            else
              const Text('Biography hidden'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleBiography,
              child: const Text('Show/Hide Biography'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openWebsite,
              child: const Text('Open Student Site'),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentInfo extends StatelessWidget {
  final String studentName;
  final String department;
  final String semester;

  const StudentInfo({
    super.key,
    required this.studentName,
    required this.department,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Student Name: $studentName'),
        const SizedBox(height: 8),
        Text('Department: $department'),
        const SizedBox(height: 8),
        Text('Semester: $semester'),
      ],
    );
  }
}
