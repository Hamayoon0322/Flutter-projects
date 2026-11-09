import 'package:flutter/material.dart';

const _departments = <String>[
  'Computer Science',
  'Software Engineering',
  'Information Technology',
  'Data Science',
];

class Lab3HomePage extends StatefulWidget {
  const Lab3HomePage({super.key});

  @override
  State<Lab3HomePage> createState() => _Lab3HomePageState();
}

class _Lab3HomePageState extends State<Lab3HomePage> {
  String? _selectedDepartment;

  Future<void> _selectDepartment() async {
    final department = await Navigator.push<String>(
      context,
      MaterialPageRoute<String>(
        builder: (_) => const SelectDepartmentPage(),
      ),
    );

    if (!mounted) return;
    setState(() => _selectedDepartment = department);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 3 - Return a Result')),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'The selected department is returned to this screen.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              _selectedDepartment ?? 'No department selected yet.',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _selectDepartment,
              child: const Text('Choose department'),
            ),
          ],
        ),
      ),
    ),
  );
}

class SelectDepartmentPage extends StatelessWidget {
  const SelectDepartmentPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Select a Department')),
    body: ListView(
      children: [
        const ListTile(
          subtitle: Text('Use the AppBar Back button to return without a result.'),
        ),
        for (final department in _departments)
          ListTile(
            leading: const Icon(Icons.school_outlined),
            title: Text(department),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pop(context, department),
          ),
      ],
    ),
  );
}
