import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan/setting_screen.dart';
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
                          final documentRank1 = snapshot2.data!.docs[0];
                          final documentRank2 = snapshot2.data!.docs[1];
                          final documentRank3 = snapshot2.data!.docs[2];
                          final documentRank4 = snapshot2.data!.docs[3];
                          final documentRank5 = snapshot2.data!.docs[4];
                          final documentRank6 = snapshot2.data!.docs[5];
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
                                                        child: ListView(
                                                          children: [
                                                            //nguoi choi 1
                                                            Card(
                                                              color:
                                                                  Colors.blue,
                                                              child: ListTile(
                                                                leading: Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .yellow,
                                                                  size: 35,
                                                                ),
                                                                title: Text(
                                                                  documentRank1[
                                                                      'name'],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                trailing: Text(
                                                                  'Điểm: ' +
                                                                      documentRank1[
                                                                              'diemRank']
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                            //nguoi choi 2

                                                            Card(
                                                              color:
                                                                  Colors.blue,
                                                              child: ListTile(
                                                                leading: Icon(
                                                                  Icons.star,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          218,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                  size: 35,
                                                                ),
                                                                title: Text(
                                                                  documentRank2[
                                                                      'name'],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                trailing: Text(
                                                                  'Điểm: ' +
                                                                      documentRank2[
                                                                              'diemRank']
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                            //nguoi choi 3
                                                            Card(
                                                              color:
                                                                  Colors.blue,
                                                              child: ListTile(
                                                                leading: Icon(
                                                                  Icons.star,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          218,
                                                                          182,
                                                                          117,
                                                                          4),
                                                                  size: 35,
                                                                ),
                                                                title: Text(
                                                                  documentRank3[
                                                                      'name'],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                trailing: Text(
                                                                  'Điểm: ' +
                                                                      documentRank3[
                                                                              'diemRank']
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                            //nguoi choi 4
                                                            Card(
                                                              color:
                                                                  Colors.blue,
                                                              child: ListTile(
                                                                leading:
                                                                    CircleAvatar(
                                                                  child: Text(
                                                                    '4',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ),
                                                                title: Text(
                                                                  documentRank4[
                                                                      'name'],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                trailing: Text(
                                                                  'Điểm: ' +
                                                                      documentRank4[
                                                                              'diemRank']
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                            //nguoi choi 5
                                                            Card(
                                                              color:
                                                                  Colors.blue,
                                                              child: ListTile(
                                                                leading:
                                                                    CircleAvatar(
                                                                  child: Text(
                                                                    '5',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ),
                                                                title: Text(
                                                                  documentRank5[
                                                                      'name'],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                trailing: Text(
                                                                  'Điểm: ' +
                                                                      documentRank5[
                                                                              'diemRank']
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                            //nguoi choi 6
                                                            Card(
                                                              color:
                                                                  Colors.blue,
                                                              child: ListTile(
                                                                leading:
                                                                    CircleAvatar(
                                                                  child: Text(
                                                                    '6',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ),
                                                                title: Text(
                                                                  documentRank6[
                                                                      'name'],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                trailing: Text(
                                                                  'Điểm: ' +
                                                                      documentRank6[
                                                                              'diemRank']
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
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
                                                          color: Color.fromARGB(
                                                              255, 255, 238, 0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: ListView(
                                                          children: [
                                                            //nguoi choi 1
                                                            Card(
                                                              child: ListTile(
                                                                leading:
                                                                    CircleAvatar(
                                                                  child:
                                                                      Text('1'),
                                                                ),
                                                                title: Center(
                                                                  child: Text(
                                                                      'Nguoi choi 1'),
                                                                ),
                                                                trailing: Icon(
                                                                    Icons.add),
                                                              ),
                                                            ),
                                                            //nguoi choi 2
                                                            Card(
                                                              child: ListTile(
                                                                leading:
                                                                    CircleAvatar(
                                                                  child:
                                                                      Text('1'),
                                                                ),
                                                                title: Center(
                                                                  child: Text(
                                                                      'Nguoi choi 2'),
                                                                ),
                                                                trailing: Icon(
                                                                    Icons.add),
                                                              ),
                                                            ),
                                                            //nguoi choi 3
                                                            Card(
                                                              child: ListTile(
                                                                leading:
                                                                    CircleAvatar(
                                                                  child:
                                                                      Text('1'),
                                                                ),
                                                                title: Center(
                                                                  child: Text(
                                                                      'Nguoi choi 3'),
                                                                ),
                                                                trailing: Icon(
                                                                    Icons.add),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
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
