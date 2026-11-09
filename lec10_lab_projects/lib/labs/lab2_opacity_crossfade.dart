import 'package:flutter/material.dart';

class Lab2Page extends StatefulWidget {
  const Lab2Page({super.key});

  @override
  State<Lab2Page> createState() => _Lab2PageState();
}

class _Lab2PageState extends State<Lab2Page> {
  bool _showProfile = true;
  bool _unlocked = false;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 2 - Opacity & CrossFade')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('AnimatedOpacity', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        FilledButton.tonal(
          onPressed: () => setState(() => _showProfile = !_showProfile),
          child: Text(_showProfile ? 'Fade out profile' : 'Fade in profile'),
        ),
        const SizedBox(height: 8),
        AnimatedOpacity(
          opacity: _showProfile ? 1 : 0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: const Text('Jordan Lee'),
              subtitle: const Text('Computer Science student'),
              trailing: const Icon(Icons.verified_outlined),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 4, bottom: 20),
          child: Text(
            'Opacity changes visibility, not layout: the faded panel keeps '
            'its space while it is transparent.',
          ),
        ),
        Text(
          'AnimatedCrossFade',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        FilledButton.tonalIcon(
          onPressed: () => setState(() => _unlocked = !_unlocked),
          icon: Icon(_unlocked ? Icons.lock_open : Icons.lock_outline),
          label: Text(_unlocked ? 'Lock content' : 'Unlock content'),
        ),
        const SizedBox(height: 8),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 500),
          firstCurve: Curves.easeOut,
          secondCurve: Curves.easeIn,
          sizeCurve: Curves.easeInOut,
          crossFadeState: _unlocked
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: const _LockPanel(
            icon: Icons.lock_outline,
            title: 'Locked',
            message: 'Tap Unlock content to reveal the profile.',
            color: Color(0xFFFFF3E0),
          ),
          secondChild: const _LockPanel(
            icon: Icons.lock_open,
            title: 'Unlocked',
            message: 'Your private profile details are now visible.',
            color: Color(0xFFE8F5E9),
          ),
        ),
      ],
    ),
  );
}

class _LockPanel extends StatelessWidget {
  const _LockPanel({
    required this.icon,
    required this.title,
    required this.message,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) => Card(
    color: color,
    child: ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(message),
    ),
  );
}
