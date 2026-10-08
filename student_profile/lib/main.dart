import 'package:flutter/material.dart';
import 'screens/profile_screen.dart';

void main() => runApp(const StudentProfileApp());

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Student Profile',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF087F73)),
      scaffoldBackgroundColor: const Color(0xFFF7F9FA),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    ),
    home: const ProfileScreen(),
  );
}
