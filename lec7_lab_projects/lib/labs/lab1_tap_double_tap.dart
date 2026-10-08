import 'package:flutter/material.dart';

class Lab1Page extends StatefulWidget {
  const Lab1Page({super.key});
  @override
  State<Lab1Page> createState() => _Lab1PageState();
}

class _Lab1PageState extends State<Lab1Page> {
  bool gestureColor = false, inkColor = false;
  bool gestureFavorite = false, inkFavorite = false;
  String position = 'No tap recorded';
  void record(TapDownDetails details) {
    final message =
        'Local: ${details.localPosition} | Global: ${details.globalPosition}';
    debugPrint(message);
    setState(() => position = message);
  }

  // GestureDetector recognizes gestures without a Material ripple.
  // InkWell adds Material splash/highlight feedback when used on Material/Ink.
  // With both tap and double-tap handlers, single tap waits for disambiguation.
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 1 - Tap & Double Tap')),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('GestureDetector'),
          const SizedBox(height: 12),
          GestureDetector(
            key: const Key('gesture-box'),
            onTapDown: record,
            onTap: () => setState(() => gestureColor = !gestureColor),
            onDoubleTap: () =>
                setState(() => gestureFavorite = !gestureFavorite),
            child: Container(
              height: 160,
              alignment: Alignment.center,
              color: gestureColor
                  ? Colors.amber.shade100
                  : Colors.teal.shade100,
              child: Icon(
                gestureFavorite ? Icons.favorite : Icons.favorite_border,
                size: 48,
                color: Colors.pink,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('InkWell'),
          const SizedBox(height: 12),
          Material(
            child: Ink(
              color: inkColor ? Colors.amber.shade100 : Colors.teal.shade100,
              child: InkWell(
                key: const Key('ink-box'),
                onTapDown: record,
                onTap: () => setState(() => inkColor = !inkColor),
                onDoubleTap: () => setState(() => inkFavorite = !inkFavorite),
                child: SizedBox(
                  height: 160,
                  child: Icon(
                    inkFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 48,
                    color: Colors.pink,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(position),
        ],
      ),
    ),
  );
}
