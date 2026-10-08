import 'package:flutter/material.dart';

class Lab4Page extends StatefulWidget {
  const Lab4Page({super.key});
  @override
  State<Lab4Page> createState() => _Lab4PageState();
}

class _Lab4PageState extends State<Lab4Page> {
  double displacement = 0;
  bool deleted = false, velocityEnabled = false;
  String status = 'Course reminder';
  static const threshold = 100.0;
  void undo() => setState(() {
    deleted = false;
    displacement = 0;
    status = 'Restored';
  });
  void finish(DragEndDetails details) {
    final speed = details.primaryVelocity ?? 0;
    final fast = velocityEnabled && speed.abs() >= 700;
    final accepted = displacement.abs() >= threshold || fast;
    final direction = fast ? speed : displacement;
    setState(() {
      deleted = accepted;
      status = accepted
          ? '${direction < 0 ? 'Left' : 'Right'} swipe - item deleted'
          : 'Swipe cancelled';
      displacement = 0;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 4 - Swipe')),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Velocity detection'),
            value: velocityEnabled,
            onChanged: (v) => setState(() => velocityEnabled = v),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 150,
            child: ClipRect(
              child: deleted
                  ? Center(child: Text(status))
                  : Transform.translate(
                      offset: Offset(displacement, 0),
                      child: GestureDetector(
                        key: const Key('swipe-card'),
                        onHorizontalDragUpdate: (details) =>
                            setState(() => displacement += details.delta.dx),
                        onHorizontalDragEnd: finish,
                        onHorizontalDragCancel: () =>
                            setState(() => displacement = 0),
                        child: Card(
                          color: Colors.teal.shade50,
                          child: const Center(
                            child: ListTile(
                              leading: Icon(Icons.event_note_outlined),
                              title: Text('Mobile Development lab'),
                              subtitle: Text('Complete gesture practice'),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Displacement: ${displacement.toStringAsFixed(0)} px'),
          if (!deleted)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(status),
            ),
          if (deleted)
            OutlinedButton.icon(
              onPressed: undo,
              icon: const Icon(Icons.undo),
              label: const Text('Undo'),
            ),
        ],
      ),
    ),
  );
}
