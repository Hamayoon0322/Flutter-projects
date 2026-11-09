import 'package:flutter/material.dart';

class Lab1Page extends StatefulWidget {
  const Lab1Page({super.key});

  @override
  State<Lab1Page> createState() => _Lab1PageState();
}

class _Lab1PageState extends State<Lab1Page> {
  bool _expanded = false;
  Duration _duration = const Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {
    final size = _expanded ? 220.0 : 120.0;
    return Scaffold(
      appBar: AppBar(title: const Text('Lab 1 - AnimatedContainer')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          SizedBox(
            height: 260,
            child: Center(
              child: AnimatedContainer(
                width: size,
                height: size,
                duration: _duration,
                curve: Curves.easeInOutCubic,
                decoration: BoxDecoration(
                  color: _expanded ? Colors.deepPurple : Colors.teal,
                  borderRadius: BorderRadius.circular(_expanded ? 48 : 8),
                ),
                child: Icon(
                  _expanded ? Icons.auto_awesome : Icons.crop_square,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
          ),
          FilledButton.icon(
            onPressed: () => setState(() => _expanded = !_expanded),
            icon: const Icon(Icons.play_arrow),
            label: Text(_expanded ? 'Return to square' : 'Animate shape'),
          ),
          const SizedBox(height: 16),
          Text('Duration: ${_duration.inMilliseconds} ms'),
          SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 400, label: Text('Quick')),
              ButtonSegment(value: 1400, label: Text('Relaxed')),
            ],
            selected: {_duration.inMilliseconds},
            onSelectionChanged: (selection) => setState(
              () => _duration = Duration(milliseconds: selection.first),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'A shorter duration feels snappy and responsive. A longer duration '
            'makes the size, color, and corner changes easier to observe, but '
            'may make frequent interactions feel sluggish.',
          ),
        ],
      ),
    );
  }
}
