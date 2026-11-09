import 'package:flutter/material.dart';

class Lab4HomePage extends StatelessWidget {
  const Lab4HomePage({super.key});

  @override
  Widget build(BuildContext context) => const _Lab4DestinationPage(
    title: 'Home',
    message: 'Open the drawer to visit the Profile or Settings screen.',
    icon: Icons.home_outlined,
  );
}

class Lab4ProfilePage extends StatelessWidget {
  const Lab4ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => const _Lab4DestinationPage(
    title: 'Profile',
    message: 'This profile screen was opened from the drawer.',
    icon: Icons.person_outline,
  );
}

class Lab4SettingsPage extends StatelessWidget {
  const Lab4SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => const _Lab4DestinationPage(
    title: 'Settings',
    message: 'This settings screen was opened from the drawer.',
    icon: Icons.settings_outlined,
  );
}

class _Lab4DestinationPage extends StatelessWidget {
  const _Lab4DestinationPage({
    required this.title,
    required this.message,
    required this.icon,
  });

  final String title;
  final String message;
  final IconData icon;

  Widget _pageFor(String destination) => switch (destination) {
    'Home' => const Lab4HomePage(),
    'Profile' => const Lab4ProfilePage(),
    'Settings' => const Lab4SettingsPage(),
    _ => throw ArgumentError.value(destination, 'destination'),
  };

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Lab 4 - $title')),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.school, color: Colors.indigo),
                ),
                SizedBox(height: 12),
                Text(
                  'Navigation Lab',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          for (final destination in const ['Home', 'Profile', 'Settings'])
            ListTile(
              leading: Icon(switch (destination) {
                'Home' => Icons.home_outlined,
                'Profile' => Icons.person_outline,
                _ => Icons.settings_outlined,
              }),
              title: Text(destination),
              selected: title == destination,
              onTap: () {
                Navigator.pop(context);
                if (title != destination) {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => _pageFor(destination),
                    ),
                  );
                }
              },
            ),
        ],
      ),
    ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            const Text(
              'Navigation pushes a new route after the drawer is closed. '
              'Use Back to return through the route stack.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
