import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan/list_rank.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../setting_screen.dart';
import 'list_users.dart';

class addfriendScreen extends StatefulWidget {
  const addfriendScreen({super.key});

  @override
  State<addfriendScreen> createState() => _addfriendState();
}

class _addfriendState extends State<addfriendScreen> {
  final loginUser = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Query<Map<String, dynamic>> detail;

  int indexDetail = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detail = FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: loginUser.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: StreamBuilder(
              stream: detail.snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  final documentDetail = snapshot.data!.docs[indexDetail];
                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .where('email', isNotEqualTo: loginUser.email)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        return ListView(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    //avarta
                                    Column(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xffFDCF09),
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "https://staticg.sportskeeda.com/editor/2022/09/71751-16644793436395-1920.jpg"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    //luot choi
                                    Column(
                                      children: [
                                        OutlinedButton.icon(
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  color: Colors.black),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.confirmation_num,
                                              color: Colors.greenAccent,
                                            ),
                                            label: Text(
                                              documentDetail['luotchoi']
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            )),
                                      ],
                                    ),
                                    //thachdau
                                    Column(
                                      children: [
                                        OutlinedButton.icon(
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  color: Colors.black),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.confirmation_num,
                                              color: Colors.blue,
                                            ),
                                            label: Text(
                                              documentDetail['luotthachdau']
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            )),
                                      ],
                                    ),
                                    //coin
                                    Column(
                                      children: [
                                        OutlinedButton.icon(
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  color: Colors.black),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.attach_money,
                                              color: Colors.yellow,
                                            ),
                                            label: Text(
                                              documentDetail['tien'].toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            )),
                                      ],
                                    ),
                                    //setting
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SettingScreen(),
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.settings,
                                            color: Colors.black,
                                          ),
                                          iconSize: 45,
                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                // nút back
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () => Navigator.pop(context),
                                      icon: Icon(
                                        Icons.arrow_back_outlined,
                                        size: 40,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                //chu add
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Thêm bạn',
                                        textScaleFactor: 2,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      //khung nhap ten
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                labelText:
                                                    'Nhập tên người chơi',
                                                labelStyle: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //nut tim` kiem
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25.0),
                                            child: Container(
                                              child: Center(
                                                child: OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    minimumSize: Size(140, 50),
                                                    backgroundColor:
                                                        Color(0xffFFFFAF),
                                                    side: BorderSide(
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Tìm kiếm',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //khung noi dung
                                      Container(
                                          width: 350,
                                          height: 370,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: listUsers()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
