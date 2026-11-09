import 'package:flutter/material.dart';

import 'labs/lab1_animated_container.dart';
import 'labs/lab2_opacity_crossfade.dart';
import 'labs/lab3_controller_tween.dart';
import 'labs/lab4_animated_builder.dart';
import 'labs/lab5_staggered_animation.dart';
import 'mini_project/animated_onboarding.dart';

void main() => runApp(const LectureTenApp());

class LectureTenApp extends StatelessWidget {
  const LectureTenApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Lecture 10 Animation Labs',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const LabHomePage(),
  );
}

class LabHomePage extends StatelessWidget {
  const LabHomePage({super.key});

  static const _labs = <({String title, IconData icon, Widget page})>[
    (
      title: 'Practical Lab 1 - AnimatedContainer',
      icon: Icons.crop_square,
      page: Lab1Page(),
    ),
    (
      title: 'Practical Lab 2 - Opacity & CrossFade',
      icon: Icons.opacity,
      page: Lab2Page(),
    ),
    (
      title: 'Practical Lab 3 - Controller & Tween',
      icon: Icons.zoom_in,
      page: Lab3Page(),
    ),
    (
      title: 'Practical Lab 4 - AnimatedBuilder',
      icon: Icons.refresh,
      page: Lab4Page(),
    ),
    (
      title: 'Practical Lab 5 - Staggered Animation',
      icon: Icons.animation,
      page: Lab5Page(),
    ),
  ];

  void _openPage(BuildContext context, Widget page) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lecture 10 - Flutter Animations')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Practical labs', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        for (final lab in _labs)
          Card(
            child: ListTile(
              leading: Icon(lab.icon),
              title: Text(lab.title),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _openPage(context, lab.page),
            ),
          ),
        const SizedBox(height: 16),
        Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: ListTile(
            leading: const Icon(Icons.waving_hand_outlined),
            title: const Text('Mini Project - Animated Onboarding'),
            subtitle: const Text('A short, replayable welcome sequence'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _openPage(context, const AnimatedOnboardingPage()),
          ),
        ),
      ],
    ),
  );
}
