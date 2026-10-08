import 'package:flutter/material.dart';

class LabOutput extends StatelessWidget {
  const LabOutput({
    super.key,
    required this.title,
    required this.lines,
    this.actions = const [],
  });
  final String title;
  final List<String> lines;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final line in lines)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SelectableText(line, style: const TextStyle(fontSize: 16)),
            ),
          ...actions,
        ],
      ),
    ),
  );
}
