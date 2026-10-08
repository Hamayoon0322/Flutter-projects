import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StudentProfilePage());
  }
}

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  bool _showBiography = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Student Name: Hamayoon Jan'),
              const Text('Department: Software Engineering'),
              const Text('Semester: 7th Semester'),
              if (_showBiography)
                const Text(
                  'I am a Software Engineering student interested in learning software development and Flutter.',
                )
              else
                const Text('Biography hidden'),
              ElevatedButton(
                onPressed: () {
                  setState(() => _showBiography = !_showBiography);
                },
                child: const Text('Show/Hide Biography'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 47, 4, 86),
            Color.fromARGB(192, 45, 7, 91),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white, fontSize: 20),
        child: child,
      ),
    );
  }
}
