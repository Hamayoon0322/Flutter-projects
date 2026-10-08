import 'package:flutter/material.dart';

void main() => runApp(const ProfileCardApp());

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DeveloperProfileCard(),
      );
}

class DeveloperProfileCard extends StatelessWidget {
  const DeveloperProfileCard({super.key});
  static const teal = Color(0xFF159C91);
  static const ink = Color(0xFF176B66);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: teal,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ProfilePhoto(),
                    SizedBox(height: 18),
                    Text('Crépin Fadjo', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 37, fontWeight: FontWeight.w800, fontStyle: FontStyle.italic, letterSpacing: -1.2)),
                    SizedBox(height: 8),
                    Text('FLUTTER DEVELOPER', style: TextStyle(color: Color(0xFFC0E6E1), fontSize: 19, fontWeight: FontWeight.w700, letterSpacing: 3)),
                    SizedBox(height: 16),
                    SizedBox(width: 210, child: Divider(color: Color(0xFF72C6BE))),
                    SizedBox(height: 28),
                    _ContactCard(icon: Icons.phone, text: '+229 96119149'),
                    SizedBox(height: 16),
                    _ContactCard(icon: Icons.email, text: 'fadcrepin@gmail.com'),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _ProfilePhoto extends StatelessWidget {
  const _ProfilePhoto();
  @override
  Widget build(BuildContext context) => const CircleAvatar(
        radius: 69,
        backgroundColor: Color(0xFFE8D7AB),
        backgroundImage: NetworkImage('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=300'),
      );
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 19),
          child: Row(children: [
            Icon(icon, color: DeveloperProfileCard.teal, size: 29),
            const SizedBox(width: 42),
            Expanded(child: Text(text, style: const TextStyle(color: DeveloperProfileCard.ink, fontSize: 22))),
          ]),
        ),
      );
}
