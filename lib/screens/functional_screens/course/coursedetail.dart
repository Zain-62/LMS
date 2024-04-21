import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/textdetail.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_application_1/widgeta/buutons.dart';
import 'package:flutter_application_1/widgeta/user_container.dart';
import 'dartdetail.dart';
import 'gester.dart';
import 'introdetail.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
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
            DetailScreen(txt: "Couse Detail"),
            Card(
              shadowColor: darkblue,
              elevation: 1,
              child: ExpansionTile(
                title: DetailScreen(txt: "1.    App development "),
                children: [
                  TxtButton(
                      onpressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CDart();
                        }));
                      },
                      txt: "Dart "),
                  const Divider(),
                  TxtButton(
                      onpressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return IntroDetail();
                        }));
                      },
                      txt: "Flutter - Introduction to Widgets "),
                  const Divider(),
                  ListTile(
                    title: const Text("Flutter - Introduction to Layouts"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const IntoGester();
                      }));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Flutter - Introduction to Gestures"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const IntoGester();
                      }));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Flutter - State Management"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const IntoGester();
                      }));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Flutter - Database Concepts"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const IntoGester();
                      }));
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Card(
              child: ExpansionTile(
                title: DetailScreen(txt: "2.    Cloud Computing"),
                children: [
                  Text("Cloud Computing"),
                  Divider(),
                  Text('Cloud Computing Roots'),
                  Divider(),
                  Text('Cloud Layers and Types'),
                  Divider()
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Card(
              child: ExpansionTile(
                title: DetailScreen(txt: "2.    Cloud Computing "),
                children: [
                  Text("Cloud Computing"),
                  Divider(),
                  Text('Cloud Computing Roots'),
                  Divider(),
                  Text('Cloud Layers and Types'),
                  Divider()
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Card(
              child: ExpansionTile(
                title: DetailScreen(txt: "2.    Cloud Computing "),
                children: [
                  Text("Cloud Computing"),
                  Divider(),
                  Text('Cloud Computing Roots'),
                  Divider(),
                  Text('Cloud Layers and Types'),
                  Divider()
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Card(
              child: ExpansionTile(
                title: DetailScreen(txt: "2.    Cloud Computing "),
                children: [
                  Text("Cloud Computing"),
                  Divider(),
                  Text('Cloud Computing Roots'),
                  Divider(),
                  Text('Cloud Layers and Types'),
                  Divider()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
