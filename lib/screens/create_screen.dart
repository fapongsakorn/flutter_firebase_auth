// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase_auth/screens/login_screen.dart';
import 'package:flutter_firebase_auth/services/AuthService.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: form_create(context),
    );
  }

  form_create(BuildContext context) {
    final Email = TextEditingController();
    final Password = TextEditingController();

    final Service = AuthService();
    return Center(
        child: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              bool response = await Service.register(Email.text, Password.text);
              if (response) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("SiGN UP SUCCESS"),
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              }
            },
            icon: Icon(Icons.app_registration_rounded),
            label: Text("Register"),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account? "),
              GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()))
                },
                child: Text(
                  "SIGN IN",
                  style: TextStyle(color: Colors.pink),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
