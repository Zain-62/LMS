import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/textdetail.dart';

class CDart extends StatefulWidget {
  const CDart({super.key});

  @override
  State<CDart> createState() => _CDartState();
}

class _CDartState extends State<CDart> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
