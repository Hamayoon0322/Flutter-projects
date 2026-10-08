import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
// import 'package:adv_basics/main.dart';
import 'package:adv_basics/starter_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'StarterScreen';

  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = StarterScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'QuestionsScreen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWideget = StarterScreen(switchScreen);
    if (activeScreen == 'QuestionsScreen') {
      screenWideget = QuestionsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5303B6), Color(0xFF40028B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWideget,
        ),
      ),
    );
  }
}
