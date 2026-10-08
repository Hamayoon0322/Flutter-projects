import 'package:flutter/material.dart';
import 'labs/lab1_spread_collections.dart';
import 'labs/lab2_map.dart';
import 'labs/lab3_functions.dart';
import 'labs/lab4_parameters_constructors.dart';
import 'labs/lab5_private_members_mixins.dart';
import 'labs/lab6_cascade_operator.dart';

void main() => runApp(const LabApp());

class LabApp extends StatelessWidget {
  const LabApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Lecture 4 Labs',
    theme: ThemeData(colorSchemeSeed: Colors.teal),
    home: const LabHome(),
  );
}

class LabHome extends StatelessWidget {
  const LabHome({super.key});
  @override
  Widget build(BuildContext context) {
    const titles = [
      'Spread & Collections',
      'Map',
      'Functions',
      'Parameters & Constructors',
      'Private Members & Mixins',
      'Cascade Operator',
    ];
    const pages = [
      Lab1Page(),
      Lab2Page(),
      Lab3Page(),
      Lab4Page(),
      Lab5Page(),
      Lab6Page(),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Lecture 4 - Practical Labs')),
      body: ListView.builder(
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
    );
  }
}
