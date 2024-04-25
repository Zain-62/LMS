import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import '../../utilities/constants.dart';

class ManageAssign extends StatefulWidget {
  const ManageAssign({super.key});

  @override
  State<ManageAssign> createState() => _ManageAssignState();
}

class _ManageAssignState extends State<ManageAssign> {
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
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: tasksRef!.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List tasksList = snapshot.data!.docs;

            if (tasksList.isEmpty) {
              return const Center(child: Text('No Tasks Saved Yet'));
            }

            // UI construct
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                  itemCount: tasksList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: darkblue,
                      child: ListTile(
                        title: Text(
                          tasksList[index]['title'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Confirmation'),
                                            content: const Row(
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                Gap(16),
                                                Text('Are you sure to delete?')
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('No')),
                                              TextButton(
                                                  onPressed: () async {
                                                    Navigator.of(context).pop();

                                                    // Delete logic here

                                                    await tasksRef!
                                                        .doc(tasksList[index]
                                                            ['taskId'])
                                                        .delete();

                                                    Fluttertoast.showToast(
                                                        msg: 'Deleted');
                                                  },
                                                  child: const Text('Yes')),
                                            ],
                                          );
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 40,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
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
