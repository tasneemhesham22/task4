import 'package:flutter/material.dart';
import 'package:quiz_app_iti/screens/score_screen.dart';
import 'package:quiz_app_iti/screens/landing_screen.dart'; // تأكد من إضافة هذا الاستيراد

class QuestionScreen extends StatefulWidget {
  final Color categoryColor;
  final List<Map<String, dynamic>> questions;

  QuestionScreen({required this.categoryColor, required this.questions});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _questionindex = 0;
  int _totalScore = 0;

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit the quiz?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context).then((value) {
        if (value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LandingScreen()),
          );
        }
        return Future.value(value);
      }),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LandingScreen()),
              );
            },
          ),
          actions: [
            Icon(Icons.message),
            SizedBox(width: 12),
            Icon(Icons.notification_add),
            SizedBox(width: 12),
            Icon(Icons.search),
            SizedBox(width: 12),
          ],
          centerTitle: true,
          title: Text("Quiz app"),
          backgroundColor: widget.categoryColor,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Question",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.questions[_questionindex]['question'],
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 22),
                for (int i = 0;
                    i <
                        (widget.questions[_questionindex]['answers'] as List)
                            .length;
                    i++)
                  ElevatedButton(
                    onPressed: () {
                      _totalScore += widget.questions[_questionindex]['answers']
                          [i]['score'] as int;

                      if (_questionindex < (widget.questions.length - 1)) {
                        setState(() {
                          _questionindex++;
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScoreScreen(
                              totalscore: _totalScore,
                              numberofquestion: widget.questions.length,
                            ),
                          ),
                        );
                      }
                      print("Your index: ${_questionindex}");
                      print("Your total score is: ${_totalScore}");
                    },
                    child: Text(
                        widget.questions[_questionindex]['answers'][i]['ans']),
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
          ],
        ),
      ),
    );
  }
}
