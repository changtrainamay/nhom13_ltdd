import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan/setting_screen.dart';
import 'package:doan/list_rank.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class rankScreen extends StatefulWidget {
  const rankScreen({super.key});

  @override
  State<rankScreen> createState() => _rankScreenState();
}

class _rankScreenState extends State<rankScreen> {
  final loginUser = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //thông tin tài khoãn
  late Query<Map<String, dynamic>> detail;
  int indexDetail = 0;
  //lịch sử
  late Query<Map<String, dynamic>> rank;
  int indexHistory = 0;
  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    detail = FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: loginUser.email);
    rank = FirebaseFirestore.instance
        .collection('users')
        .orderBy('diemRank', descending: true);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Expanded(
              child: StreamBuilder(
                stream: detail.snapshots(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    final document = snapshot.data!.docs[indexDetail];
                    return StreamBuilder(
                      stream: rank.snapshots(),
                      builder: ((context, snapshot2) {
                        if (snapshot2.hasData) {
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
                                              backgroundColor:
                                                  Color(0xffFDCF09),
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
                                                document['luotchoi'].toString(),
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
                                                document['luotthachdau']
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
                                                document['tien'].toString(),
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
                                  //nut tro lai
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Xếp hạng',
                                        textScaleFactor: 2,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  // cái khung
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          // tap bar
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 300,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white,
                                                  ),
                                                  child: TabBar(
                                                      indicator: BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255, 255, 238, 0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      tabs: [
                                                        Tab(
                                                          child: Text(
                                                            'Single',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                        Tab(
                                                          child: Text(
                                                            'Challenge',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // tap bar view
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 400,
                                                width: 320,
                                                child: TabBarView(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: listRank(),
                                                      ),
                                                    ),
                                                    //trang 2
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
<<<<<<< HEAD
                                                        child: Container(
                                                            color: Colors.blue),
=======
                                                        child: listRank(),
>>>>>>> 6e4e254b9fa1e8f7e0e6a7ad3cdf5ded3cec4dcb
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
