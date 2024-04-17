import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppColors {
  static const Color white = Colors.white;
  static const Color darkblue = Color.fromARGB(255, 4, 45, 78);
}

class dates {
  static String getHumanReadableDate(int timestamp) {
    DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm:ss');

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    return dateFormat.format(dateTime);
  }
}
