import 'package:flutter/material.dart';

import '../../../utilities/textdetail.dart';

class CDart extends StatefulWidget {
  const CDart({super.key});

  @override
  State<CDart> createState() => _CDartState();
}

class _CDartState extends State<CDart> {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DetailScreen(txt: "Introduction to Dart Programming"),
                DetailScreen(txt: "Variables and Data types"),
                DetailScreen(txt: "Loops"),
                DetailScreen(txt: "Functions"),
                DetailScreen(txt: "Object Oriented Programming")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
