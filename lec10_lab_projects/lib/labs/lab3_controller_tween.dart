import 'package:flutter/material.dart';

class Lab3Page extends StatefulWidget {
  const Lab3Page({super.key});

  @override
  State<Lab3Page> createState() => _Lab3PageState();
}

class _Lab3PageState extends State<Lab3Page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _scale = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animate() => _controller.forward(from: 0);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 3 - Controller & Tween')),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: _scale,
              child: const Icon(
                Icons.flutter_dash,
                size: 112,
                color: Colors.lightBlue,
              ),
            ),
            const SizedBox(height: 36),
            const Text(
              'The Tween maps controller progress to a scale from 0.8 to 1.2.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _animate,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Play scale animation'),
            ),
          ],
        ),
      ),
    ),
  );
}
