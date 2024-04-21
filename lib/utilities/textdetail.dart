import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/constants.dart';

class DetailScreen extends StatelessWidget {
  final String txt;
  DetailScreen({Key? key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Card(
        color: darkblue,
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            txt,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: fullwhite),
          ),
        ),
      ),
    );
  }
}
