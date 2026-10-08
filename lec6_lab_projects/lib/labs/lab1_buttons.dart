import 'package:flutter/material.dart';

class Lab1Page extends StatefulWidget {
  const Lab1Page({super.key});
  @override
  State<Lab1Page> createState() => _Lab1PageState();
}

class _Lab1PageState extends State<Lab1Page> {
  bool enabled = true;
  bool favorite = false;
  int count = 0;
  String status = 'Ready';
  void report(String message) => setState(() => status = message);
  // ElevatedButton emphasizes the primary Save action. TextButton and
  // OutlinedButton serve secondary actions; the FAB is a frequent Add action.
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Lab 1 - Buttons'),
      actions: [
        PopupMenuButton<String>(
          tooltip: 'More actions',
          onSelected: report,
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'Profile selected', child: Text('Profile')),
            PopupMenuItem(value: 'Settings selected', child: Text('Settings')),
            PopupMenuItem(value: 'Help selected', child: Text('Help')),
          ],
        ),
      ],
    ),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(status, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 24),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Enable saving'),
            value: enabled,
            onChanged: (value) => setState(() => enabled = value),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: enabled ? () => report('Saved successfully') : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
            ),
            icon: const Icon(Icons.save_outlined),
            label: const Text('Save'),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => report('Cancelled'),
            child: const Text('Cancel'),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => report('Details selected'),
            child: const Text('View details'),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              tooltip: favorite ? 'Remove favorite' : 'Add favorite',
              icon: Icon(
                favorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.pink,
              ),
              onPressed: () => setState(() {
                favorite = !favorite;
                status = favorite
                    ? 'Added to favorites'
                    : 'Removed from favorites';
              }),
            ),
          ),
          Text('Items added: $count'),
          const SizedBox(height: 80),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      tooltip: 'Add item',
      onPressed: () => setState(() {
        count++;
        status = 'Item added';
      }),
      child: const Icon(Icons.add),
    ),
  );
}
