// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserDetailContainer extends StatefulWidget {
  UserDetailContainer({super.key});

  @override
  State<UserDetailContainer> createState() => _UserDetailContainerState();
}

class _UserDetailContainerState extends State<UserDetailContainer> {
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

    setState(() {
      CircleAvatar(
        backgroundColor: AppColors.darkblue,
        radius: 40,
        backgroundImage: NetworkImage(userSnapshot!['photo'] as String),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.2,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              stops: [0.5, 0.85],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 4, 45, 78),
                Color.fromARGB(255, 12, 22, 31),
              ])),
      child: userSnapshot == null
          ? const Center(
              child: SpinKitDualRing(color: AppColors.darkblue),
            )
          : InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const ProfileScreen(),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${userSnapshot!['name']}',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          'Course: ${userSnapshot!['course']}',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          maxLines: 2, // Set to 2 to limit to two lines
                          overflow:
                              TextOverflow.ellipsis, // Show ellipsis (...) for
                          'email: ${userSnapshot!['email']}',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CircleAvatar(
                        backgroundColor: AppColors.darkblue,
                        radius: 40,
                        backgroundImage:
                            NetworkImage(userSnapshot!['photo'] as String),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class DashContainer extends StatelessWidget {
  var icons1;
  var icons2;
  String txt;
  final VoidCallback voidCallback;
  DashContainer(
      {super.key,
      required this.icons1,
      this.icons2,
      required this.txt,
      required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: voidCallback,
      child: Container(
        height: height * 0.15,
        width: width * 0.35,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 5)]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Icon(
                  icons1,
                  size: height * 0.06,
                  color: AppColors.darkblue,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 35),
                  child: Icon(
                    icons2,
                    size: height * 0.04,
                    color: AppColors.darkblue,
                  ),
                ),
              ],
            ),
            Text(
              txt,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.darkblue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
