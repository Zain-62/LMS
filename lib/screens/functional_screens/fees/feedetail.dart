import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/constants.dart';

class FeeDetail extends StatelessWidget {
  String cName;
  String fee;
  FeeDetail({super.key, required this.cName, required this.fee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Card(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Card(
                color: darkblue,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    cName,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: fullwhite),
                  ),
                ),
              ),
            ),
            Text(
              "Total Fee: $fee",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
