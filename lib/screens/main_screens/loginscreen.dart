// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import '../../utilities/constants.dart';
import '../../widgeta/buutons.dart';
import '../../widgeta/shimmer.dart';
import '../../widgeta/textfield.dart';
import 'registerscreen.dart';
import 'varificationscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailC, passC;

  @override
  void initState() {
    emailC = TextEditingController();
    passC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/book.png',
                height: height * 0.25,
              ),
              const Text(
                'Study-camp',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: darkblue,
                ),
              ),
              const Gap(50),
              TextFields(
                control: emailC,
                icon: const Icon(
                  Icons.person,
                ),
                hint: 'Enter your Email',
                lbl: 'User Email',
              ),
              TextFields(
                obs: true,
                control: passC,
                icon: const Icon(
                  Icons.lock,
                ),
                hint: 'Enter your password',
                lbl: 'password',
              ),
              const Gap(70),
              SizedBox(
                  height: height * 0.06,
                  width: width * 0.5,
                  child: Elevated(
                    txt: 'Login',
                    voidCallback: () async {
                      try {
                        FirebaseAuth auth = FirebaseAuth.instance;

                        UserCredential userC =
                            await auth.signInWithEmailAndPassword(
                                email: emailC.text.trim(),
                                password: passC.text.trim());

                        if (userC.user!.emailVerified) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return const ShimmerScreen();
                          }));
                        } else {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const EmailVerificationScreen();
                          }));
                        }
                      } on FirebaseAuthException catch (e) {
                        // you can display custom messages
                        if (e.code == 'user-not-found') {}

                        Fluttertoast.showToast(msg: e.message!, fontSize: 30);
                      }
                    },
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const RegisterScrren(),
                      ),
                    );
                  },
                  child: const Text('REgister'))
            ],
          ),
        ),
      )),
    );
  }
}
