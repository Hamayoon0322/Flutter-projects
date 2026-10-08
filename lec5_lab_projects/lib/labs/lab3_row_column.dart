import 'package:flutter/material.dart';

class Lab3Page extends StatefulWidget {
  const Lab3Page({super.key});
  @override
  State<Lab3Page> createState() => _Lab3PageState();
}

class _Lab3PageState extends State<Lab3Page> {
  MainAxisAlignment main = MainAxisAlignment.start;
  CrossAxisAlignment cross = CrossAxisAlignment.start;

  // Column: main axis is vertical, cross axis is horizontal.
  // Row: main axis is horizontal, cross axis is vertical.
  // Bounded height/width leaves room for the alignment changes to be visible.
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 3 - Row & Column')),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<MainAxisAlignment>(
              initialValue: main,
              decoration: const InputDecoration(
                labelText: 'Main axis alignment',
              ),
              items: MainAxisAlignment.values
                  .map(
                    (value) =>
                        DropdownMenuItem(value: value, child: Text(value.name)),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) setState(() => main = value);
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<CrossAxisAlignment>(
              initialValue: cross,
              decoration: const InputDecoration(
                labelText: 'Cross axis alignment',
              ),
              items:
                  [
                        CrossAxisAlignment.start,
                        CrossAxisAlignment.center,
                        CrossAxisAlignment.end,
                        CrossAxisAlignment.stretch,
                      ]
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(value.name),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                if (value != null) setState(() => cross = value);
              },
            ),
            const SizedBox(height: 24),
            Container(
              height: 260,
              padding: const EdgeInsets.all(16),
              color: Colors.teal.shade50,
              child: Column(
                mainAxisAlignment: main,
                crossAxisAlignment: cross,
                children: const [
                  Text(
                    'Ahmad',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text('ID: 104'),
                  SizedBox(height: 12),
                  Text('Computer Science'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 120,
              padding: const EdgeInsets.all(12),
              color: Colors.amber.shade50,
              child: Row(
                mainAxisAlignment: main,
                crossAxisAlignment: cross,
                children: [
                  const Icon(Icons.email_outlined),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      'ahmad@example.com',
                      textAlign: switch (cross) {
                        CrossAxisAlignment.center => TextAlign.center,
                        CrossAxisAlignment.end => TextAlign.right,
                        _ => TextAlign.left,
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
