import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic Dua App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Islamic Dua'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentDuaIndex = 0;

  final List<String> _duas = [
    'Allahumma barik lana fi ma razaqtana waqina azabannar.',
    'SubhanAllah wa bihamdihi, subhanAllahil azim.',
    'Alhamdulillah, Rabbil alamin.',
  ];

  void _incrementCounter() {
    setState(() {
      if (_counter >= 100) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Maximum reached: 100')));
        return;
      }
      _counter++;
    });
  }

  void _previousDua() {
    setState(() {
      if (_currentDuaIndex > 0) {
        _currentDuaIndex--;
      }
    });
  }

  void _nextDua() {
    setState(() {
      if (_currentDuaIndex < _duas.length - 1) {
        _currentDuaIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _currentDuaIndex == 0 ? null : _previousDua,
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: _currentDuaIndex == _duas.length - 1
                      ? null
                      : _nextDua,
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _duas[_currentDuaIndex],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
