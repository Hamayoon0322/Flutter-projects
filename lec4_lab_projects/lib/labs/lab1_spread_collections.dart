import 'package:flutter/material.dart';
import 'lab_output.dart';

List<String> runLab1({bool isAdmin = true}) {
  final topics1 = ['Dart', 'Flutter'];
  final topics2 = ['Widgets', 'State management'];
  final List<String>? optionalTopics = null;
  final combined = [...topics1, ...topics2, ...?optionalTopics];
  final menu = ['Home', 'Profile', if (isAdmin) 'Admin'];
  final labels = [for (final topic in combined) 'Topic: $topic'];
  return [
    'First list: $topics1',
    'Second list: $topics2',
    'Spread and null-aware spread: $combined',
    'Optional nullable list: $optionalTopics',
    'Menu: $menu',
    ...labels,
    'Flutter children lists can spread existing widgets, use collection-if to show widgets conditionally, and collection-for to build widgets from data. LabOutput uses collection-for and spread in its children list.',
  ];
}

class Lab1Page extends StatelessWidget {
  const Lab1Page({super.key});
  @override
  Widget build(BuildContext context) =>
      LabOutput(title: 'Lab 1 - Spread & Collections', lines: runLab1());
}
