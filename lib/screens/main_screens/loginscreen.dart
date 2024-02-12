import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screens/dashboard.dart';
import 'package:flutter_application_1/screens/main_screens/registerscreen.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_application_1/widgeta/buutons.dart';
import 'package:flutter_application_1/widgeta/textfield.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  color: AppColors.darkblue,
                ),
              ),
              const Gap(50),
              TextFields(
                icon: const Icon(
                  Icons.person,
                ),
                hint: 'Enter your Id',
                lbl: 'User Id',
              ),
              TextFields(
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
                    voidCallback: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const DashBoard(),
                        ),
                      );
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
                  child: Text('REgister'))
            ],
          ),
        ),
      )),
    );
  }
}
