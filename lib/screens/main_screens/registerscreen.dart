import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screens/loginscreen.dart';
import 'package:gap/gap.dart';

import '../../utilities/constants.dart';
import '../../widgeta/buutons.dart';
import '../../widgeta/textfield.dart';

class RegisterScrren extends StatefulWidget {
  const RegisterScrren({super.key});

  @override
  State<RegisterScrren> createState() => _RegisterScrrenState();
}

class _RegisterScrrenState extends State<RegisterScrren> {
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
                  color: AppColors.darkblue,
                ),
              ),
            ),
            const Gap(20),
            TextFields(
              icon: const Icon(
                Icons.person,
              ),
              hint: 'Enter your Name',
              lbl: 'Name',
            ),
            TextFields(
              icon: const Icon(
                Icons.mail,
              ),
              hint: 'Enter your email',
              lbl: 'User Email',
            ),
            TextFields(
              icon: const Icon(
                Icons.school,
              ),
              hint: 'Select course',
              lbl: 'Course',
            ),
            TextFields(
              icon: const Icon(
                Icons.lock,
              ),
              hint: 'Enter your password',
              lbl: 'password',
            ),
            TextFields(
              icon: const Icon(
                Icons.lock,
              ),
              hint: 'Re enter password',
              lbl: 'Confirm Password',
            ),
            const Gap(70),
            SizedBox(
                height: height * 0.06,
                width: width * 0.5,
                child: Elevated(
                  txt: 'Register',
                  voidCallback: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const LoginScreen(),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    ));
  }
}
