// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/constants.dart';

class Elevated extends StatelessWidget {
  String txt;
  final VoidCallback voidCallback;
  Elevated({super.key, required this.txt, required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: voidCallback,
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkblue),
      child: Text(
        txt,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class TxtButton extends StatelessWidget {
  String txt;
  final VoidCallback onpressed;
  TxtButton({super.key, required this.onpressed, required this.txt});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onpressed, child: Text(txt));
  }
}
