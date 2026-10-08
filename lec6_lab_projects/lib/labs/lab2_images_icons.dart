import 'package:flutter/material.dart';

class Lab2Page extends StatelessWidget {
  const Lab2Page({super.key});
  Widget imageError(BuildContext context, Object error, StackTrace? stack) =>
      const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.broken_image_outlined, size: 40),
            SizedBox(height: 8),
            Text('Image unavailable'),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 2 - Images & Icons')),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Row(
            children: [
              Icon(Icons.photo_library_outlined, color: Colors.teal),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Flutter image gallery',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Local image'),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: Image.asset(
              'assets/images/flutter.png',
              fit: BoxFit.contain,
              semanticLabel: 'Flutter logo',
            ),
          ),
          const SizedBox(height: 20),
          const Text('Remote image'),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              fit: BoxFit.cover,
              semanticLabel: 'Owl photograph',
              errorBuilder: imageError,
              loadingBuilder: (_, child, progress) => progress == null
                  ? child
                  : const Center(child: CircularProgressIndicator()),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Unavailable image'),
          const SizedBox(height: 8),
          SizedBox(
            height: 150,
            child: Image.network(
              'https://example.invalid/missing-image.jpg',
              fit: BoxFit.contain,
              errorBuilder: imageError,
            ),
          ),
        ],
      ),
    ),
  );
}
