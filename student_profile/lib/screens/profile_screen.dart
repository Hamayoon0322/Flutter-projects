import 'package:flutter/material.dart';
import '../models/student.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Student student = Student.sample;

  Future<void> edit() async {
    final updated = await Navigator.push<Student>(
      context,
      MaterialPageRoute(builder: (_) => EditProfileScreen(student: student)),
    );
    if (!mounted || updated == null) return;
    setState(() => student = updated);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Profile updated')));
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        actions: [
          IconButton(
            onPressed: edit,
            tooltip: 'Edit profile',
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
        bottom: const TabBar(
          tabs: [
            Tab(text: 'Profile'),
            Tab(text: 'Courses'),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          children: [
            SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 12),
                        const Center(
                          child: CircleAvatar(
                            radius: 48,
                            backgroundColor: Color(0xFFD7EEE8),
                            child: Icon(
                              Icons.school_outlined,
                              size: 48,
                              color: Color(0xFF087F73),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          student.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          student.id,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Center(
                          child: Chip(
                            avatar: Icon(Icons.check_circle_outline, size: 18),
                            label: Text('Active student'),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'Academic Details',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        _Detail(
                          icon: Icons.school_outlined,
                          label: 'Department',
                          value: student.department,
                        ),
                        _Detail(
                          icon: Icons.calendar_month_outlined,
                          label: 'Semester',
                          value: '${student.semester}',
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Contact Details',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        _Detail(
                          icon: Icons.email_outlined,
                          label: 'Email',
                          value: student.email,
                        ),
                        _Detail(
                          icon: Icons.phone_outlined,
                          label: 'Phone',
                          value: student.phone,
                        ),
                        const SizedBox(height: 24),
                        FilledButton.icon(
                          onPressed: edit,
                          icon: const Icon(Icons.edit_outlined),
                          label: const Text('Edit profile'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const _Courses(),
          ],
        ),
      ),
    ),
  );
}

class _Detail extends StatelessWidget {
  const _Detail({required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF087F73)),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(color: Colors.grey.shade700)),
              const SizedBox(height: 4),
              SelectableText(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _Courses extends StatelessWidget {
  const _Courses();
  static const courses = [
    ('CS 301', 'Advanced Mobile Programming', 3, Icons.phone_android),
    ('CS 302', 'Database Systems', 3, Icons.storage_outlined),
    ('CS 303', 'Software Engineering', 3, Icons.code),
    ('CS 304', 'Computer Networks', 3, Icons.lan_outlined),
  ];
  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 720),
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'Enrolled Courses',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          const Text('4 courses - 12 credits'),
          const SizedBox(height: 24),
          for (final course in courses)
            Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  leading: Icon(course.$4, color: const Color(0xFF087F73)),
                  title: Text(course.$2),
                  subtitle: Text('${course.$1} - ${course.$3} credits'),
                ),
                const Divider(height: 1),
              ],
            ),
        ],
      ),
    ),
  );
}
