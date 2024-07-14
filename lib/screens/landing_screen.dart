import 'package:flutter/material.dart';
import 'package:quiz_app_iti/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/landing_background_img.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/app_logo.png",
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 20),
                const Text(
                  'ITI Quizz App',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.amber,
                    fontFamily: 'Pacifico', // تعيين الخط "Pacifico"
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'We are creative, enjoy the app',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Pacifico', // تعيين الخط "Pacifico"
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => LoginScreen()),
                  );
                },
                child: const Text(
                  'go to login screen ',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
