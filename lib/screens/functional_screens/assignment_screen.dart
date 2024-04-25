import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utilities/constants.dart';
import '../../utilities/textdetail.dart';

class StAssign extends StatefulWidget {
  const StAssign({super.key});

  @override
  State<StAssign> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<StAssign> {
  CollectionReference? tasksRef;

  @override
  void initState() {
    tasksRef = FirebaseFirestore.instance.collection('tasks');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assignments',
          style: TextStyle(color: darkblue),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: tasksRef!.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List tasksList = snapshot.data!.docs;

            if (tasksList.isEmpty) {
              return const Center(child: Text(' No assignment found'));
            }

            // UI construct
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                  itemCount: tasksList.length,
                  itemBuilder: (context, index) {
                    return Card(
                        color: darkblue,
                        child: DetailScreen(
                          txt: tasksList[index]['title'],
                        ));
                  }),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else {
            return const Center(child: SpinKitDualRing(color: Colors.purple));
          }
        },
      ),
    );
  }
}
