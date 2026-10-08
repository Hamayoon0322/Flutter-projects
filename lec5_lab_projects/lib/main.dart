import 'package:flutter/material.dart';
import 'labs/lab1_safearea_container.dart';
import 'labs/lab2_text_richtext.dart';
import 'labs/lab3_row_column.dart';
import 'labs/lab4_nested_layout.dart';

void main() => runApp(const LabApp());

class LabApp extends StatelessWidget {
  const LabApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Lecture 5 Labs',
    theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
    home: const LabHome(),
  );
}

class LabHome extends StatelessWidget {
  const LabHome({super.key});
  @override
  Widget build(BuildContext context) {
    const titles = [
      'SafeArea & Container',
      'Text & RichText',
      'Row & Column',
      'Nested Layout',
    ];
    const pages = [Lab1Page(), Lab2Page(), Lab3Page(), Lab4Page()];
    return Scaffold(
      appBar: AppBar(title: const Text('Lecture 5 - Practical Labs')),
      body: SafeArea(
        child: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Lab ${index + 1} - ${titles[index]}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => pages[index]),
            ),
          ),
        ),
      ),
    );
  }
}
