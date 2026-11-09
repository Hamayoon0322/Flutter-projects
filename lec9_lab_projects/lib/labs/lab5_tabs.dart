import 'package:flutter/material.dart';

class LabCourse {
  const LabCourse({
    required this.name,
    required this.instructor,
    required this.status,
  });

  final String name;
  final String instructor;
  final String status;
}

const _labCourses = <LabCourse>[
  LabCourse(
    name: 'Mobile App Development',
    instructor: 'Dr. Rahman',
    status: 'Active',
  ),
  LabCourse(
    name: 'Human-Computer Interaction',
    instructor: 'Prof. Khan',
    status: 'Active',
  ),
  LabCourse(
    name: 'Database Systems',
    instructor: 'Dr. Ahmad',
    status: 'Completed',
  ),
];

class Lab5CoursesPage extends StatelessWidget {
  const Lab5CoursesPage({super.key});

  List<LabCourse> _coursesFor(String category) => switch (category) {
    'All' => _labCourses,
    'Active' => _labCourses.where((course) => course.status == 'Active').toList(),
    'Completed' =>
      _labCourses.where((course) => course.status == 'Completed').toList(),
    _ => const [],
  };

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Lab 5 - Course Tabs'),
        bottom: const TabBar(
          tabs: [
            Tab(text: 'All', icon: Icon(Icons.library_books_outlined)),
            Tab(text: 'Active', icon: Icon(Icons.play_circle_outline)),
            Tab(text: 'Completed', icon: Icon(Icons.check_circle_outline)),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          for (final category in const ['All', 'Active', 'Completed'])
            _LabCourseList(courses: _coursesFor(category)),
        ],
      ),
    ),
  );
}

class _LabCourseList extends StatelessWidget {
  const _LabCourseList({required this.courses});

  final List<LabCourse> courses;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Tabs switch the current view; they do not push routes onto the '
            'navigation stack.',
          ),
        ),
      ),
      for (final course in courses)
        Card(
          child: ListTile(
            leading: const Icon(Icons.menu_book_outlined),
            title: Text(course.name),
            subtitle: Text('${course.instructor} - ${course.status}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (_) => Lab5CourseDetailsPage(course: course),
              ),
            ),
          ),
        ),
    ],
  );
}

class Lab5CourseDetailsPage extends StatelessWidget {
  const Lab5CourseDetailsPage({required this.course, super.key});

  final LabCourse course;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Course Details')),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(course.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text('Instructor: ${course.instructor}'),
          Text('Status: ${course.status}'),
          const SizedBox(height: 20),
          const Text('Use Back to return to the same selected course tab.'),
        ],
      ),
    ),
  );
}
