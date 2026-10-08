import 'package:flutter/material.dart';

class Lab5Page extends StatefulWidget {
  const Lab5Page({super.key});
  @override
  State<Lab5Page> createState() => _Lab5PageState();
}

class _Lab5PageState extends State<Lab5Page> {
  double scale = 1, startScale = 1;
  bool interactive = false;
  final transformation = TransformationController();
  @override
  void dispose() {
    transformation.dispose();
    super.dispose();
  }

  void reset() => setState(() {
    scale = 1;
    transformation.value = Matrix4.identity();
  });
  // Custom scale uses the scale captured at gesture start, avoiding compounding.
  // InteractiveViewer supplies built-in zoom, panning and boundary handling.
  // Test pinch with two pointers on a physical device or emulator multi-touch.
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 5 - Pinch to Zoom')),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: false, label: Text('Custom')),
                ButtonSegment(value: true, label: Text('InteractiveViewer')),
              ],
              selected: {interactive},
              onSelectionChanged: (value) =>
                  setState(() => interactive = value.first),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.grey.shade200),
                clipBehavior: Clip.hardEdge,
                child: interactive
                    ? InteractiveViewer(
                        transformationController: transformation,
                        minScale: 0.5,
                        maxScale: 4,
                        panEnabled: true,
                        child: Center(
                          child: Image.asset(
                            'assets/images/photo.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    : GestureDetector(
                      key: const Key('custom-zoom'),
                      behavior: HitTestBehavior.opaque,
                        onScaleStart: (_) => startScale = scale,
                        onScaleUpdate: (details) => setState(
                          () => scale = (startScale * details.scale).clamp(
                            0.5,
                            4.0,
                          ),
                        ),
                        child: Center(
                          child: Transform.scale(
                            scale: scale,
                            child: Image.asset(
                              'assets/images/photo.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 12),
            if (!interactive) Text('Zoom: ${scale.toStringAsFixed(2)}x'),
            OutlinedButton.icon(
              onPressed: reset,
              icon: const Icon(Icons.refresh),
              label: const Text('Reset'),
            ),
          ],
        ),
      ),
    ),
  );
}
