import 'package:flutter/material.dart';

class Lab1Page extends StatelessWidget {
  const Lab1Page({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 1 - SafeArea & Container')),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Margin is outside each colored box; padding is inside its border.
            // The colored area includes padding, while margin shows the background.
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 160,
                height: 100,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Dart',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 220,
                height: 140,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(24),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Flutter',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 280,
                height: 180,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(32),
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Mobile Development',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
