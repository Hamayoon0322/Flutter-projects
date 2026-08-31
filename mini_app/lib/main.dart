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
      title: 'Course Welcome App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // url_launcher is used here to open a simple course-related page.
  Future<void> _openCourseLink() async {
    final Uri url = Uri.parse('https://example.com');
    if (!await launchUrl(url)) {
      throw Exception('Could not open the link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Course Welcome App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Advanced Mobile Programming',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            const Text('CS.SE.0731', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            const Text('7th Semester', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _openCourseLink,
              child: const Text('Open Course Info'),
            ),
            const SizedBox(height: 30),
            const Text('Counter:'),
            Text('$_counter', style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increase Count'),
            ),
          ],
        ),
      ),
    );
  }
}
