import 'package:flutter/material.dart';
import 'package:quiz_app_iti/screens/landing_screen.dart';
//import 'package:quiz_app_iti/screens/playWithStateManagment.dart';
//import 'package:quiz_app_iti/screens/question_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF001F3F)),
          useMaterial3: true),
      home: LandingScreen(),
    );
  }
}
