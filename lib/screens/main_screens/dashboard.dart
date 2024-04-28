import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utilities/constants.dart';
import '../../utilities/textdetail.dart';
import '../../widgeta/user_container.dart';
import '../admin/adminscreen.dart';
import '../functional_screens/assignment_screen.dart';
import '../functional_screens/attendence_screen.dart';
import '../functional_screens/course/coursedetail.dart';
import '../functional_screens/fees/fee_screen.dart';
import 'loginscreen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  DocumentSnapshot? userSnapshot;

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  getUserDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    setState(() {});
  }

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
            backgroundColor: darkblue,
          ),
          drawer: Drawer(
            child: Column(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const AdminDashboard(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.abc))
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                const UserDetailContainer(),
                const SizedBox(
                  height: 10,
                ),
                const DetailScreen(txt: "Notifications"),
                const SizedBox(
                  height: 20,
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
                            builder: (BuildContext context) => const StAssign(),
                          ),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
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
                                const CourseDetail(),
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
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashContainer(
                      icons1: Icons.message_outlined,
                      icons2: Icons.messenger_outlined,
                      txt: 'Query',
                      voidCallback: () {
                        // ignore: deprecated_member_use
                        launch('https://wa.me/message/ROZDRCMNK3CMP1');
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
