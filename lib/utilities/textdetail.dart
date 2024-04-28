import 'package:flutter/material.dart';

import 'constants.dart';

class DetailScreen extends StatelessWidget {
  final String txt;
  // ignore: use_key_in_widget_constructors
  const DetailScreen({Key? key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
