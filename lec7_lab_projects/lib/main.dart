import 'package:flutter/material.dart';
import 'labs/lab1_tap_double_tap.dart';
import 'labs/lab2_long_press.dart';
import 'labs/lab3_drag.dart';
import 'labs/lab4_swipe.dart';
import 'labs/lab5_pinch_zoom.dart';

void main() => runApp(const LabApp());

class LabApp extends StatelessWidget {
  const LabApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Lecture 7 Labs',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
    home: const LabHome(),
  );
}

class LabHome extends StatelessWidget {
  const LabHome({super.key});
  @override
  Widget build(BuildContext context) {
    const names = [
      'Tap & Double Tap',
      'Long Press',
      'Drag',
      'Swipe',
      'Pinch to Zoom',
    ];
    const pages = [Lab1Page(), Lab2Page(), Lab3Page(), Lab4Page(), Lab5Page()];
    return Scaffold(
      appBar: AppBar(title: const Text('Lecture 7 - Gesture Labs')),
      body: SafeArea(
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, i) => ListTile(
            leading: CircleAvatar(child: Text('${i + 1}')),
            title: Text('Lab ${i + 1} - ${names[i]}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => pages[i]),
            ),
          ),
        ),
      ),
    );
  }
}
