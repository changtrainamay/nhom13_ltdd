import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan/addfriend_screen.dart';

import 'package:doan/list_frends.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../setting_screen.dart';

class Listfriend_Screen extends StatefulWidget {
  const Listfriend_Screen({super.key});

  @override
  State<Listfriend_Screen> createState() => _Listfriend_ScreenState();
}

class _Listfriend_ScreenState extends State<Listfriend_Screen> {
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
                  return ListView(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                        side: BorderSide(color: Colors.black),
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
                                        documentDetail['luotchoi'].toString(),
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
                                        side: BorderSide(color: Colors.black),
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
                                        side: BorderSide(color: Colors.black),
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
                                          builder: (context) => SettingScreen(),
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
                                  color: Colors.black,
                                ),
                                iconSize: 40,
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                          // cái text list friends
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Danh sách bạn bè',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          // list bạn
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 500,
                                width: 350,
                                child: listFrend(),
                              ),
                            ],
                          ),
                          //nút thêm bạn
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Center(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Color(0xffAFFFFA),
                                        minimumSize: Size(100, 50),
                                        side: BorderSide(
                                          width: 1.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                addfriendScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Thêm bạn',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
