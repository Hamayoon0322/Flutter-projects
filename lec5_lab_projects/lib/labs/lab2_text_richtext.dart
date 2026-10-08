import 'package:flutter/material.dart';

class Lab2Page extends StatelessWidget {
  const Lab2Page({super.key});
  @override
  Widget build(BuildContext context) {
    const name = 'Ahmad';
    const id = 104;
    const semester = 3;
    return Scaffold(
      appBar: AppBar(title: const Text('Lab 2 - Text & RichText')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Advanced Mobile Programming',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'This course explores mobile application development using Dart and Flutter. Students practice building responsive interfaces, composing widgets, managing application state, handling user input, and creating complete mobile experiences through practical laboratory exercises.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(
                    context,
                  ).style.copyWith(fontSize: 18),
                  children: const [
                    TextSpan(text: 'Build with '),
                    TextSpan(
                      text: 'Dart',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Flutter',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: ' to create mobile apps.'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Student: $name\nID: $id\nSemester: $semester',
                style: TextStyle(fontSize: 18, height: 1.6),
              ),
              const SizedBox(height: 24),
              Text(
                'Department of Computer Science',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
