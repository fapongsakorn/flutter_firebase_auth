// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase_auth/main.dart';
import 'package:flutter_firebase_auth/services/AuthService.dart';
import 'package:flutter_firebase_auth/screens/create_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: login_form(context),
    );
  }
}

login_form(BuildContext context) {
  final Email = TextEditingController();
  final Password = TextEditingController();
  final Service = AuthService();

  return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Email"),
            controller: Email,
          ),
          TextField(
            decoration: InputDecoration(hintText: "Password"),
            controller: Password,
          ),
          Padding(padding: EdgeInsets.all(20)),
          ElevatedButton.icon(
              onPressed: () async {
                bool response = await Service.login(
                    email: Email.text, password: Password.text);
                if (response) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Login success"),
                    ),
                  );
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                }
              },
              icon: Icon(Icons.login),
              label: Text("Login")),
          Padding(padding: EdgeInsets.all(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Need an account? "),
              GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateAccount()))
                },
                child: Text(
                  "SIGN UP",
                  style: TextStyle(color: Colors.pink),
                ),
              )
            ],
          )
        ],
      ));
}
