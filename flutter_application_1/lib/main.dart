import 'package:flutter/material.dart';
import 'package:flutter_application_1/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer([
          Color.fromARGB(187, 8, 197, 191),
          Color.fromARGB(255, 12, 84, 132),
        ]),
      ),
    ),
  );
}
