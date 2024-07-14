import 'package:flutter/material.dart';
import 'package:quiz_app_iti/screens/category_screen.dart';
import 'package:quiz_app_iti/screens/landing_screen.dart';
import 'package:quiz_app_iti/utils/globals.dart';

class ScoreScreen extends StatelessWidget {
  final int totalscore;
  final int numberofquestion;
  const ScoreScreen({
    super.key,
    required this.numberofquestion,
    required this.totalscore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Hello ',
                  ),
                  TextSpan(
                    text: '$username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: ', you have finished the quiz, and your score is',
                  ),
                ],
              ),
            ),
            Text(
              "${totalscore}/${numberofquestion}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => CategoryScreen(),
                  ),
                );
              },
              child: Text("Play again"),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => LandingScreen(),
                  ),
                );
              },
              child: Text("Exit"),
            ),
          ],
        ),
      ),
    );
  }
}
