import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/functional_screens/assignment_screen.dart';
import 'package:flutter_application_1/screens/functional_screens/attendence_screen.dart';
import 'package:flutter_application_1/screens/main_screens/loginscreen.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_application_1/widgeta/user_container.dart';

import '../main_screens/registerscreen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(230, 255, 255, 255),
          appBar: AppBar(
            title: const Text(
              'Admin portal',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: AppColors.darkblue,
          ),
          drawer: const Drawer(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                UserDetailContainer(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashContainer(
                      icons1: Icons.person,
                      icons2: Icons.done_outline_outlined,
                      txt: 'Attendence',
                      voidCallback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const AttendenceScreen(),
                          ),
                        );
                      },
                    ),
                    DashContainer(
                      icons1: Icons.assignment,
                      icons2: Icons.edit,
                      txt: 'Assignments',
                      voidCallback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const AssignmentScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashContainer(
                      icons1: Icons.school_sharp,
                      txt: 'Register\nstudent',
                      voidCallback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const RegisterScrren(),
                          ),
                        );
                      },
                    ),
                    DashContainer(
                      icons1: Icons.person,
                      icons2: Icons.logout_outlined,
                      txt: 'Logout',
                      voidCallback: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
