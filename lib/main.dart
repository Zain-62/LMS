import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screens/dashboard.dart';
import 'package:flutter_application_1/screens/main_screens/loginscreen.dart';
import 'screens/main_screens/splash_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAa20EcWQ0GUEUcVvrSZYxyh_6oPspU3yQ',
    appId: '1:823024169394:android:5d567a4af05c2c1cbbb4ab',
    messagingSenderId: '823024169394',
    projectId: 'lms-firebase-c58dc',
    storageBucket: 'lms-firebase-c58dc.appspot.com',
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? const DashBoard()
          : const LoginScreen(),
    );
  }
}
