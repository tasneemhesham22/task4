import 'package:flutter/material.dart';
import 'package:quiz_app_iti/screens/category_screen.dart';
import 'package:quiz_app_iti/utils/globals.dart';
import 'package:quiz_app_iti/utils/icons.dart'; // تأكد من أن المسار صحيح

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formkey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  // Function to reset the text fields
  void resetFields() {
    userNameController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001F3F),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  app_logo,
                  height: 200,
                  width: 200,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 2 / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        controller: userNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username field cannot be empty";
                          } else if (value.length < 3) {
                            return "Username must be more than 3 characters";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Username",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password field cannot be empty";
                          } else if (value.length < 6) {
                            return "Password must be more than or equal to 6 characters";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.visibility_off),
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text("New to quiz app? "),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            if (_formkey.currentState?.validate() ?? false) {
                              username = userNameController.text;
                              resetFields(); // Reset fields after successful login
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        CategoryScreen()),
                              );
                            }
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Image.asset(
                        fingerprint,
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Use touch ID",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (val) {}),
                          Text('Remember me'),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget password",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
