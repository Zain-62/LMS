import 'package:flutter/material.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/textdetail.dart';
import '../../../widgeta/buutons.dart';
import '../../../widgeta/user_container.dart';
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
            const UserDetailContainer(),
            const SizedBox(
              height: 30,
            ),
            const DetailScreen(txt: "Couse Detail"),
            Card(
              shadowColor: darkblue,
              elevation: 1,
              child: ExpansionTile(
                title: const DetailScreen(txt: "1.    App development "),
                children: [
                  TxtButton(
                      onpressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const CDart();
                        }));
                      },
                      txt: "Dart "),
                  const Divider(),
                  TxtButton(
                      onpressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const IntroDetail();
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
            const Card(
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
            const Card(
              child: ExpansionTile(
                title: DetailScreen(txt: "2.    Networking "),
                children: [
                  Text("Cloud & Data Center."),
                  Divider(),
                  Text('Mobile & Wireless'),
                  Divider(),
                  Text('Network Security.'),
                  Divider()
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            const Card(
              child: ExpansionTile(
                title: DetailScreen(txt: "2.   web development "),
                children: [
                  Text("Html"),
                  Divider(),
                  Text('CSS'),
                  Divider(),
                  Text('Javascript'),
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
