// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  String lbl = '';
  String hint = '';
  bool obs;
  var icon;
  var control;
  var keyboard;
  TextFields(
      {required this.hint,
      required this.lbl,
      super.key,
      this.icon,
      required this.control,
      this.keyboard,
      this.obs = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: TextField(
        obscureText: obs,
        keyboardType: keyboard,
        controller: control,
        decoration: InputDecoration(
            prefix: icon,
            hoverColor: Colors.blue,
            label: Text(lbl),
            hintText: hint,
            labelStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
