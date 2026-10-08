import 'package:flutter/material.dart';

class Lab2Page extends StatefulWidget {
  const Lab2Page({super.key});
  @override
  State<Lab2Page> createState() => _Lab2PageState();
}

class _Lab2PageState extends State<Lab2Page> {
  bool favorite = false;
  String status = 'Mobile Development notes';
  Future<void> actions() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.favorite_outline),
              title: Text(favorite ? 'Remove favorite' : 'Add favorite'),
              onTap: () => Navigator.pop(sheetContext, 'favorite'),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('View details'),
              onTap: () => Navigator.pop(sheetContext, 'details'),
            ),
          ],
        ),
      ),
    );
    if (!mounted || result == null) return;
    setState(() {
      if (result == 'favorite') {
        favorite = !favorite;
        status = favorite ? 'Added to favorites' : 'Removed from favorites';
      } else {
        status = 'Lecture 7 - Gesture practice notes';
      }
    });
  }

  // Long press is hidden until discovered; a visible action button provides
  // an equivalent path for keyboard, accessibility and first-time users.
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 2 - Long Press')),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GestureDetector(
            onLongPress: actions,
            onLongPressStart: (details) => debugPrint(
              'Long press local: ${details.localPosition}, global: ${details.globalPosition}',
            ),
            child: Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Icon(
                  favorite ? Icons.favorite : Icons.description_outlined,
                ),
                title: const Text('Mobile Development'),
                subtitle: Text(status),
                trailing: IconButton(
                  tooltip: 'Open actions',
                  icon: const Icon(Icons.more_vert),
                  onPressed: actions,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
