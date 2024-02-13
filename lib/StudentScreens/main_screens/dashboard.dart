import 'package:flutter/material.dart';
import 'package:flutter_application_1/StudentScreens/main_screens/loginscreen.dart';
import 'package:flutter_application_1/screens/functional_screens/assignment_screen.dart';
import 'package:flutter_application_1/screens/functional_screens/attendence_screen.dart';
import 'package:flutter_application_1/screens/functional_screens/course_screen.dart';
import 'package:flutter_application_1/screens/functional_screens/fee_screen.dart';
import 'package:flutter_application_1/screens/functional_screens/query_screen.dart';

import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_application_1/widgeta/user_container.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(230, 255, 255, 255),
          appBar: AppBar(
            title: const Text(
              'Study-camp',
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
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserDetailContainer(
                  name: 'zain ul abidin',
                  Id: '12827',
                  course: 'App development',
                ),
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
                      txt: 'Course detail',
                      voidCallback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const CourseScreen(),
                          ),
                        );
                      },
                    ),
                    DashContainer(
                      icons1: Icons.bar_chart_outlined,
                      icons2: Icons.border_all_rounded,
                      txt: 'Fee record',
                      voidCallback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const FeeScreen(),
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
                      icons1: Icons.message_outlined,
                      icons2: Icons.messenger_outlined,
                      txt: 'Query',
                      voidCallback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const QueryScrren(),
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
