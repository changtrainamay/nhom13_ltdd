import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class listRank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .orderBy('diemRank', descending: true)
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
<<<<<<< HEAD
=======
                        onTap: () {},
>>>>>>> 6e4e254b9fa1e8f7e0e6a7ad3cdf5ded3cec4dcb
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.yellow,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: NetworkImage(
                                "https://staticg.sportskeeda.com/editor/2022/09/71751-16644793436395-1920.jpg"),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              doc['name'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Điểm: ' + doc['diemRank'].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: null,
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
