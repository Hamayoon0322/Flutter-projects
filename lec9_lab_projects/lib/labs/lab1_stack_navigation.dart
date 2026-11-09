import 'package:flutter/material.dart';

class Lab1HomePage extends StatelessWidget {
  const Lab1HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 1 - Home')),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.layers_outlined, size: 56),
            const SizedBox(height: 16),
            const Text(
              'This is the first route in this lab.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () => Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const Lab1DetailsPage(),
                ),
              ),
              icon: const Icon(Icons.open_in_new),
              label: const Text('Open details'),
            ),
          ],
        ),
      ),
    ),
  );
}

class Lab1DetailsPage extends StatelessWidget {
  const Lab1DetailsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 1 - Details')),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Details is now on top of the route stack. '
              'The AppBar Back button or this button pops it.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Navigator.pop'),
            ),
          ],
        ),
      ),
    ),
  );
}
