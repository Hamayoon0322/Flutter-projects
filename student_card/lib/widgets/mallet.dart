import 'package:flutter/material.dart';

class Mallet extends StatelessWidget {
  const Mallet({super.key, required this.rotation});

  final double rotation;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,
      child: SizedBox(
        width: 30,
        height: 170,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 28),
              width: 9,
              height: 130,
              decoration: BoxDecoration(
                color: const Color(0xFF8A522E),
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x550B1721),
                    blurRadius: 5,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
            ),
            Container(
              width: 30,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE1A66A),
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                  colors: [Color(0xFFF1C18A), Color(0xFFC47A42)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
