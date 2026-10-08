import 'package:flutter/material.dart';

enum XylophoneNote {
  c4('C4', 'assets/audio/c4.wav', Color(0xFFE84A4A)),
  d4('D4', 'assets/audio/d4.wav', Color(0xFFF28B3C)),
  e4('E4', 'assets/audio/e4.wav', Color(0xFFF2C94C)),
  f4('F4', 'assets/audio/f4.wav', Color(0xFF69B56B)),
  g4('G4', 'assets/audio/g4.wav', Color(0xFF59B7C7)),
  a4('A4', 'assets/audio/a4.wav', Color(0xFF4C8FD8)),
  b4('B4', 'assets/audio/b4.wav', Color(0xFF4B5EC4)),
  c5('C5', 'assets/audio/c5.wav', Color(0xFF7957B5)),
  d5('D5', 'assets/audio/d5.wav', Color(0xFFD45B9B)),
  e5('E5', 'assets/audio/e5.wav', Color(0xFFE979A9));

  const XylophoneNote(this.label, this.assetPath, this.color);

  final String label;
  final String assetPath;
  final Color color;
}
