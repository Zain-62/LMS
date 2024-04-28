// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/main_screens/profile.dart';
import '../utilities/constants.dart';

class UserDetailContainer extends StatefulWidget {
  const UserDetailContainer({super.key});

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

    setState(() {});
    //print(userSnapshot! as Map<String, dynamic>);
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
          ? const Center(child: Text('loading'))
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
                          '${userSnapshot!['name']}',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          '${userSnapshot!['course']}',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          maxLines: 2, // Set to 2 to limit to two lines
                          overflow:
                              TextOverflow.ellipsis, // Show ellipsis (...) for
                          '${userSnapshot!['email']}',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: userSnapshot!['photo'] == null
                          ? const CircleAvatar(
                              radius: 40,
                            )
                          : CircleAvatar(
                              backgroundColor: darkblue,
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  userSnapshot!['photo'] as String),
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
        height: height * 0.14,
        width: width * 0.38,
        decoration: BoxDecoration(
          color: fullwhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Icon(
                  icons1,
                  size: height * 0.06,
                  color: darkblue,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 35),
                  child: Icon(
                    icons2,
                    size: height * 0.04,
                    color: darkblue,
                  ),
                ),
              ],
            ),
            Text(
              txt,
              style: const TextStyle(
                fontSize: 14,
                color: darkblue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
