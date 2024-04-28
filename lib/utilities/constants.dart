import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color fullwhite = Colors.white;
const Color darkblue = Color.fromARGB(255, 4, 45, 78);

// ignore: camel_case_types
class dates {
  static String getHumanReadableDate(int timestamp) {
    DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm:ss');

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    return dateFormat.format(dateTime);
  }
}
