// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../utilities/constants.dart';
import '../../widgeta/buutons.dart';
import '../../widgeta/textfield.dart';

class RegisterScrren extends StatefulWidget {
  const RegisterScrren({super.key});

  @override
  State<RegisterScrren> createState() => _RegisterScrrenState();
}

class _RegisterScrrenState extends State<RegisterScrren> {
  late TextEditingController nameC, mobileC, emailC, passC, courseC;
  @override
  void initState() {
    nameC = TextEditingController();
    mobileC = TextEditingController();
    emailC = TextEditingController();
    passC = TextEditingController();
    courseC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameC.dispose();
    mobileC.dispose();
    emailC.dispose();
    passC.dispose();
    courseC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: const Text(
                'Study-camp',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: darkblue,
                ),
              ),
            ),
            const Gap(20),
            TextFields(
              control: nameC,
              icon: const Icon(
                Icons.person,
              ),
              hint: 'Enter your Name',
              lbl: 'Name',
            ),
            TextFields(
              control: emailC,
              icon: const Icon(
                Icons.mail,
              ),
              hint: 'Enter your email',
              lbl: 'User Email',
            ),
            TextFields(
              control: courseC,
              icon: const Icon(
                Icons.school,
              ),
              hint: 'Select course',
              lbl: 'Course',
            ),
            TextFields(
              keyboard: TextInputType.number,
              control: mobileC,
              icon: const Icon(
                Icons.phone,
              ),
              hint: 'Enter your Number',
              lbl: 'Phone',
            ),
            TextFields(
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
                  txt: 'Register',
                  voidCallback: () async {
                    try {
                      FirebaseAuth auth = FirebaseAuth.instance;

                      UserCredential? userCredentials =
                          await auth.createUserWithEmailAndPassword(
                        email: emailC.text.trim(),
                        password: passC.text.trim(),
                      );

                      if (userCredentials.user != null) {
                        FirebaseFirestore firebaseFirestore =
                            FirebaseFirestore.instance;

                        await firebaseFirestore
                            .collection('users')
                            .doc(userCredentials.user!.uid)
                            .set({
                          'name': nameC.text.trim(),
                          'mobile': mobileC.text.trim(),
                          'email': emailC.text.trim(),
                          'course': courseC.text.trim(),
                          'Password': passC.text.trim(),
                          'uid': userCredentials.user!.uid,
                          'createdOn': DateTime.now().millisecondsSinceEpoch,
                          'photo': null,
                        });
                      }

                      Fluttertoast.showToast(msg: 'Success', fontSize: 30);
                      Navigator.pop(context);
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                      print(e.message!);

                      Fluttertoast.showToast(msg: e.message!, fontSize: 30);
                    }
                  },
                ))
          ],
        ),
      ),
    ));
  }
}
