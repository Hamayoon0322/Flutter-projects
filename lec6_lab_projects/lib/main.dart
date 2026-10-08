import 'package:flutter/material.dart';
import 'labs/lab1_buttons.dart';
import 'labs/lab2_images_icons.dart';
import 'labs/lab3_asset_bundle.dart';
import 'labs/lab4_validated_form.dart';

void main() => runApp(const LabApp());

class LabApp extends StatelessWidget {
  const LabApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Lecture 6 Labs',
    theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
    home: const LabHome(),
  );
}

class LabHome extends StatelessWidget {
  const LabHome({super.key});
  @override
  Widget build(BuildContext context) {
    const titles = [
      'Buttons',
      'Images & Icons',
      'AssetBundle',
      'Validated Form',
    ];
    const pages = [Lab1Page(), Lab2Page(), Lab3Page(), Lab4Page()];
    return Scaffold(
      appBar: AppBar(title: const Text('Lecture 6 - Practical Labs')),
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
