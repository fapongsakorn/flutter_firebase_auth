import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/screens/create_screen.dart';
import 'package:flutter_firebase_auth/screens/login_screen.dart';
import 'package:flutter_firebase_auth/services/AuthService.dart';

import 'const/burger.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const CreateAccount(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final service = AuthService();
    User? currentuser = service.user;
    String displayEmail = "";
    String displayName = "";

    if (currentuser != null && currentuser.email != null) {
      displayEmail = currentuser.email!;
    }
    return WelCome(displayEmail: displayEmail);
  }
}

Widget WelCome({required String displayEmail}) {
  return Scaffold(
    drawer: Burger(
      displayEmail: displayEmail,
    ),
    appBar: AppBar(
      title: Text("HomePage"),
    ),
  );
}
