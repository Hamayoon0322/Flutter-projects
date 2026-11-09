import 'package:flutter/material.dart';

class Lab4Page extends StatefulWidget {
  const Lab4Page({super.key});

  @override
  State<Lab4Page> createState() => _Lab4PageState();
}

class _Lab4PageState extends State<Lab4Page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 4 - AnimatedBuilder')),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _controller,
            child: const Icon(
              Icons.explore,
              size: 120,
              color: Colors.deepPurple,
            ),
            builder: (context, child) => Transform.rotate(
              angle: _controller.value * 2 * 3.141592653589793,
              child: child,
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton(
                onPressed: () => _controller.forward(from: 0),
                child: const Text('Forward'),
              ),
              FilledButton.tonal(
                onPressed: () => _controller.reverse(from: 1),
                child: const Text('Reverse'),
              ),
              FilledButton.tonal(
                onPressed: _controller.repeat,
                child: const Text('Repeat'),
              ),
              OutlinedButton(
                onPressed: _controller.stop,
                child: const Text('Stop'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
