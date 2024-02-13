import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screens/dashboard.dart';
import 'package:flutter_application_1/screens/main_screens/loginscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  (FirebaseAuth.instance.currentUser != null &&
                          FirebaseAuth.instance.currentUser!.emailVerified)
                      ? const DashBoard()
                      : const LoginScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        'assets/LMS.gif',
      ),
    ));
  }
}
