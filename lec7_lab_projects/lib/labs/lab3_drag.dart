import 'package:flutter/material.dart';

class Lab3Page extends StatefulWidget {
  const Lab3Page({super.key});
  @override
  State<Lab3Page> createState() => _Lab3PageState();
}

class _Lab3PageState extends State<Lab3Page> {
  Offset offset = Offset.zero;
  static const size = 64.0;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 3 - Drag')),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, bounds) {
                  final maxX = (bounds.maxWidth - size).clamp(
                    0.0,
                    double.infinity,
                  );
                  final maxY = (bounds.maxHeight - size).clamp(
                    0.0,
                    double.infinity,
                  );
                  final visible = Offset(
                    offset.dx.clamp(0.0, maxX),
                    offset.dy.clamp(0.0, maxY),
                  );
                  return Container(
                    key: const Key('drag-area'),
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.teal.shade50,
                    child: Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        Transform.translate(
                          offset: visible,
                          child: GestureDetector(
                            key: const Key('drag-square'),
                            onPanUpdate: (details) => setState(() {
                              final next = visible + details.delta;
                              offset = Offset(
                                next.dx.clamp(0.0, maxX),
                                next.dy.clamp(0.0, maxY),
                              );
                            }),
                            child: Container(
                              width: size,
                              height: size,
                              color: Colors.teal,
                              child: const Icon(
                                Icons.open_with,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Position: ${offset.dx.toStringAsFixed(0)}, ${offset.dy.toStringAsFixed(0)}',
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => setState(() => offset = Offset.zero),
              icon: const Icon(Icons.refresh),
              label: const Text('Reset'),
            ),
          ],
        ),
      ),
    ),
  );
}
