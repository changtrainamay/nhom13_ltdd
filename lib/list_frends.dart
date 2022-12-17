import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class listFrend extends StatelessWidget {
  final loginUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('frends')
          .where('email', isEqualTo: loginUser.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ListView(
            children: documents
                .map(
                  (doc) => Card(
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.yellow,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: NetworkImage(
                                "https://staticg.sportskeeda.com/editor/2022/09/71751-16644793436395-1920.jpg"),
                          ),
                        ),
                        title: Text(
                          doc['nameFrend'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Email: ' + doc['emailFrend'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.person_off),
                          onPressed: () {
                            if (0 == 0) {
                              final delete = FirebaseFirestore.instance
                                  .collection("frends")
                                  .doc(doc.id);
                              delete.delete();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Huỷ bạn thành công."),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Huỷ bạn không thành công"),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
