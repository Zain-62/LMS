import 'package:flutter/material.dart';

import '../../../utilities/textdetail.dart';
import '../../../widgeta/user_container.dart';
import 'feedetail.dart';

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
            const UserDetailContainer(),
            const SizedBox(
              height: 30,
            ),
            const DetailScreen(txt: "Fee record"),
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
