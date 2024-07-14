import 'package:flutter/material.dart';
import 'package:quiz_app_iti/data/quiz_app_data.dart';
import 'package:quiz_app_iti/utils/globals.dart';
import 'package:quiz_app_iti/widgets/category_card.dart';
import 'package:quiz_app_iti/screens/question_screen.dart';
import 'package:quiz_app_iti/screens/login_screen.dart'; // استخدم اسم شاشة الدخول الصحيح هنا

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key});

  final List<Map<String, dynamic>> data = [
    {'name': "Iq Quiz", 'color': Colors.red, 'questions': iqQuestions},
    {
      'name': "Sport Quiz",
      'color': Color.fromARGB(255, 242, 240, 240),
      'questions': sportsQuestions
    },
    {
      'name': "History Quiz",
      'color': Colors.green,
      'questions': historyQuestions
    }
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Widget يستخدم WillPopScope للتعامل مع عملية الرجوع
      onWillPop: () async {
        // عرض حوار التأكيد عند الضغط على زر الرجوع
        bool confirmLogout = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to logout and go back to login screen?'),
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
        );

        if (confirmLogout == true) {
          // Clear username when logging out
          username = '';
          // Return true to allow popping the route
          return true;
        } else {
          // Return false to prevent popping the route
          return false;
        }
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < data.length; i++)
              Expanded(
                child: CategoryCard(
                  quizName: data[i]['name'],
                  quizColor: data[i]['color'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionScreen(
                          categoryColor: data[i]['color'],
                          questions: data[i]['questions'],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
