import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String quizName;
  final Color quizColor;
  final VoidCallback onTap;

  const CategoryCard({
    required this.quizName,
    required this.quizColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: quizColor,
        child: Center(
          child: Text(
            quizName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
