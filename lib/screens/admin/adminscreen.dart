import 'package:flutter/material.dart';
import '../../utilities/constants.dart';
import '../../widgeta/user_container.dart';
import '../functional_screens/attendence_screen.dart';
import '../main_screens/loginscreen.dart';
import '../main_screens/registerscreen.dart';
import 'manageassign.dart';
import 'uploadass.dart';

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
            backgroundColor: darkblue,
          ),
          drawer: const Drawer(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                const UserDetailContainer(),
                const SizedBox(
                  height: 30,
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
                      icons1: Icons.assignment,
                      icons2: Icons.edit,
                      txt: 'upload Assignments',
                      voidCallback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const AddTaskScreen(),
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
                      icons1: Icons.assignment,
                      txt: 'Assignments',
                      voidCallback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ManageAssign(),
                          ),
                        );
                      },
                    ),
                    DashContainer(
                      icons1: Icons.assignment,
                      icons2: Icons.edit,
                      txt: 'Notification',
                      voidCallback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const AddTaskScreen(),
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
