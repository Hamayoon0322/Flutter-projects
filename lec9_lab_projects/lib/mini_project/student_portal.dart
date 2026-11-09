import 'package:flutter/material.dart';

class PortalCourse {
  const PortalCourse({
    required this.id,
    required this.title,
    required this.instructor,
    required this.status,
    required this.description,
  });

  final String id;
  final String title;
  final String instructor;
  final String status;
  final String description;
}

const _portalCourses = <PortalCourse>[
  PortalCourse(
    id: 'CS-301',
    title: 'Advanced Mobile Programming',
    instructor: 'Dr. Rahman',
    status: 'Active',
    description:
        'Build mobile applications and practice navigation, state, and UI '
        'patterns with Flutter.',
  ),
  PortalCourse(
    id: 'CS-315',
    title: 'Human-Computer Interaction',
    instructor: 'Prof. Khan',
    status: 'Active',
    description:
        'Study user-centered design, usability evaluation, and accessible '
        'interactive systems.',
  ),
  PortalCourse(
    id: 'CS-220',
    title: 'Database Systems',
    instructor: 'Dr. Ahmad',
    status: 'Completed',
    description:
        'Learn relational data modeling, SQL, transactions, and database '
        'design.',
  ),
  PortalCourse(
    id: 'CS-250',
    title: 'Data Structures',
    instructor: 'Prof. Malik',
    status: 'Completed',
    description:
        'Explore common data structures, algorithmic trade-offs, and '
        'complexity.',
  ),
];

class StudentPortalLoginPage extends StatefulWidget {
  const StudentPortalLoginPage({super.key});

  @override
  State<StudentPortalLoginPage> createState() => _StudentPortalLoginPageState();
}

class _StudentPortalLoginPageState extends State<StudentPortalLoginPage> {
  final _nameController = TextEditingController(text: 'Alex Morgan');

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _login() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter your name to continue.')),
      );
      return;
    }

    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (_) => StudentDashboardPage(studentName: name),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Student Portal - Login')),
    body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: ListView(
          padding: const EdgeInsets.all(24),
          shrinkWrap: true,
          children: [
            Icon(
              Icons.school_outlined,
              size: 72,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome to the Student Portal',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Student name',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _login(),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _login,
              child: const Text('Continue to dashboard'),
            ),
          ],
        ),
      ),
    ),
  );
}

class StudentDashboardPage extends StatelessWidget {
  const StudentDashboardPage({required this.studentName, super.key});

  final String studentName;

  @override
  Widget build(BuildContext context) => _PortalPage(
    title: 'Dashboard',
    currentDestination: 'Dashboard',
    studentName: studentName,
    child: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Welcome, $studentName',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        const Text('Your courses and student account are ready.'),
        const SizedBox(height: 20),
        Card(
          child: ListTile(
            leading: const Icon(Icons.menu_book_outlined),
            title: const Text('Your courses'),
            subtitle: const Text('2 active, 2 completed'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _openPortalDestination(context, 'Courses', studentName),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Your profile'),
            subtitle: const Text('View and edit your details'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _openPortalDestination(context, 'Profile', studentName),
          ),
        ),
      ],
    ),
  );
}

class StudentCoursesPage extends StatelessWidget {
  const StudentCoursesPage({required this.studentName, super.key});

  final String studentName;

  List<PortalCourse> _coursesFor(String category) => switch (category) {
    'All' => _portalCourses,
    'Active' =>
      _portalCourses.where((course) => course.status == 'Active').toList(),
    'Completed' =>
      _portalCourses.where((course) => course.status == 'Completed').toList(),
    _ => const [],
  };

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: _PortalPage(
      title: 'Courses',
      currentDestination: 'Courses',
      studentName: studentName,
      appBarBottom: const TabBar(
        tabs: [
          Tab(text: 'All'),
          Tab(text: 'Active'),
          Tab(text: 'Completed'),
        ],
      ),
      child: TabBarView(
        children: [
          for (final category in const ['All', 'Active', 'Completed'])
            _PortalCourseList(
              courses: _coursesFor(category),
              studentName: studentName,
            ),
        ],
      ),
    ),
  );
}

class _PortalCourseList extends StatelessWidget {
  const _PortalCourseList({
    required this.courses,
    required this.studentName,
  });

  final List<PortalCourse> courses;
  final String studentName;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(12),
    children: [
      for (final course in courses)
        Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(course.id.substring(course.id.length - 2)),
            ),
            title: Text(course.title),
            subtitle: Text('${course.instructor} - ${course.status}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (_) => StudentCourseDetailsPage(
                  studentName: studentName,
                  course: course,
                ),
              ),
            ),
          ),
        ),
    ],
  );

}

class StudentCourseDetailsPage extends StatelessWidget {
  const StudentCourseDetailsPage({
    required this.studentName,
    required this.course,
    super.key,
  });

  final String studentName;
  final PortalCourse course;

  @override
  Widget build(BuildContext context) => _PortalPage(
    title: 'Course Details',
    currentDestination: 'Courses',
    studentName: studentName,
    child: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(course.title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        _CourseData(label: 'Course ID', value: course.id),
        _CourseData(label: 'Instructor', value: course.instructor),
        _CourseData(label: 'Status', value: course.status),
        const SizedBox(height: 16),
        Text(course.description),
      ],
    ),
  );
}

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({required this.studentName, super.key});

  final String studentName;

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  late String _studentName = widget.studentName;

  Future<void> _editProfile() async {
    final updatedName = await Navigator.push<String>(
      context,
      MaterialPageRoute<String>(
        builder: (_) => EditProfilePage(initialName: _studentName),
      ),
    );

    if (!mounted || updatedName == null) return;
    setState(() => _studentName = updatedName);
  }

  @override
  Widget build(BuildContext context) => _PortalPage(
    title: 'Profile',
    currentDestination: 'Profile',
    studentName: _studentName,
    child: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        CircleAvatar(
          radius: 36,
          child: Text(_studentName.characters.first.toUpperCase()),
        ),
        const SizedBox(height: 16),
        Text(_studentName, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text('Student account'),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: _editProfile,
          icon: const Icon(Icons.edit_outlined),
          label: const Text('Edit profile'),
        ),
      ],
    ),
  );
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({required this.initialName, super.key});

  final String initialName;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final _nameController = TextEditingController(text: widget.initialName);

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _save() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name cannot be empty.')),
      );
      return;
    }
    Navigator.pop(context, name);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Edit Profile')),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Student name',
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _save(),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _save,
              child: const Text('Save changes'),
            ),
          ),
        ],
      ),
    ),
  );
}

class StudentSettingsPage extends StatelessWidget {
  const StudentSettingsPage({required this.studentName, super.key});

  final String studentName;

  @override
  Widget build(BuildContext context) => _PortalPage(
    title: 'Settings',
    currentDestination: 'Settings',
    studentName: studentName,
    child: ListView(
      children: [
        SwitchListTile(
          value: true,
          onChanged: null,
          title: Text('Course announcements'),
          subtitle: Text('Notification preference demo'),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('About the Student Portal'),
          subtitle: Text('Navigation and routing mini project'),
        ),
      ],
    ),
  );
}

class _PortalPage extends StatelessWidget {
  const _PortalPage({
    required this.title,
    required this.currentDestination,
    required this.studentName,
    required this.child,
    this.appBarBottom,
  });

  final String title;
  final String currentDestination;
  final String studentName;
  final Widget child;
  final PreferredSizeWidget? appBarBottom;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title),
      bottom: appBarBottom,
    ),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.school_outlined),
                ),
                const SizedBox(height: 12),
                Text(
                  studentName,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Text(
                  'Student Portal',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          for (final destination in const [
            'Dashboard',
            'Courses',
            'Profile',
            'Settings',
          ])
            ListTile(
              leading: Icon(_destinationIcon(destination)),
              title: Text(destination),
              selected: currentDestination == destination,
              onTap: () {
                Navigator.pop(context);
                if (destination != currentDestination) {
                  _openPortalDestination(context, destination, studentName);
                }
              },
            ),
        ],
      ),
    ),
    body: child,
  );
}

IconData _destinationIcon(String destination) => switch (destination) {
  'Dashboard' => Icons.dashboard_outlined,
  'Courses' => Icons.menu_book_outlined,
  'Profile' => Icons.person_outline,
  'Settings' => Icons.settings_outlined,
  _ => Icons.circle_outlined,
};

Widget _portalPageFor(String destination, String studentName) =>
    switch (destination) {
      'Dashboard' => StudentDashboardPage(studentName: studentName),
      'Courses' => StudentCoursesPage(studentName: studentName),
      'Profile' => StudentProfilePage(studentName: studentName),
      'Settings' => StudentSettingsPage(studentName: studentName),
      _ => throw ArgumentError.value(destination, 'destination'),
    };

void _openPortalDestination(
  BuildContext context,
  String destination,
  String studentName,
) {
  Navigator.push<void>(
    context,
    MaterialPageRoute<void>(
      builder: (_) => _portalPageFor(destination, studentName),
    ),
  );
}

class _CourseData extends StatelessWidget {
  const _CourseData({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Text('$label: $value'),
  );
}
