import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/functional_screens/fees/feedetail.dart';
import 'package:flutter_application_1/utilities/textdetail.dart';
import 'package:flutter_application_1/widgeta/user_container.dart';

class FeeScreen extends StatefulWidget {
  const FeeScreen({super.key});

  @override
  State<FeeScreen> createState() => _FeeScreenState();
}

class _FeeScreenState extends State<FeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            UserDetailContainer(),
            const SizedBox(
              height: 30,
            ),
            DetailScreen(txt: "Fee record"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            FeeDetail(cName: 'App Development', fee: "10,000"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            FeeDetail(cName: 'Cloud computing', fee: "8,000"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            FeeDetail(cName: 'Cisco Networking', fee: "15,000"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            FeeDetail(cName: 'Web development', fee: "10,000"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
          ],
        ),
      ),
    );
  }
}
