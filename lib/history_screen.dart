import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../detailaccount_screen.dart';
import '../setting_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  final loginUser = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //thông tin tài khoãn
  late Query<Map<String, dynamic>> detail;
  int indexDetail = 0;
  //lịch sử
  late Query<Map<String, dynamic>> history;
  int indexHistory = 0;
  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    detail = FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: loginUser.email);
    history = FirebaseFirestore.instance
        .collection('resultPlayNow')
        .where(loginUser.email.toString())
        .orderBy('thoigian', descending: true);
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
                      stream: history.snapshots(),
                      builder: ((context, snapshot2) {
                        if (snapshot2.hasData) {
                          final documentHistory1 = snapshot2.data!.docs[0];
                          final documentHistory2 = snapshot2.data!.docs[1];
                          final documentHistory3 = snapshot2.data!.docs[2];
                          final documentHistory4 = snapshot2.data!.docs[3];
                          final documentHistory5 = snapshot2.data!.docs[4];
                          final documentHistory6 = snapshot2.data!.docs[5];
                          final documentHistory7 = snapshot2.data!.docs[6];
                          final documentHistory8 = snapshot2.data!.docs[7];

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
                                        'Lịch sử chơi',
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
                                                                title: Center(
                                                                  child: Text('Điểm: ' +
                                                                      documentHistory1[
                                                                              'diem']
                                                                          .toString() +
                                                                      '      Thời gian: ' +
                                                                      documentHistory1[
                                                                              'tongthoigian']
                                                                          .toString() +
                                                                      's'),
                                                                ),
                                                                subtitle: Text(
                                                                  (documentHistory1[
                                                                              'thoigian']
                                                                          as Timestamp)
                                                                      .toDate()
                                                                      .toString(),
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
                                                                title: Center(
                                                                  child: Text('Điểm: ' +
                                                                      documentHistory2[
                                                                              'diem']
                                                                          .toString() +
                                                                      '      Thời gian: ' +
                                                                      documentHistory2[
                                                                              'tongthoigian']
                                                                          .toString() +
                                                                      's'),
                                                                ),
                                                                subtitle: Text(
                                                                  (documentHistory2[
                                                                              'thoigian']
                                                                          as Timestamp)
                                                                      .toDate()
                                                                      .toString(),
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
                                                                title: Center(
                                                                  child: Text('Điểm: ' +
                                                                      documentHistory3[
                                                                              'diem']
                                                                          .toString() +
                                                                      '      Thời gian: ' +
                                                                      documentHistory3[
                                                                              'tongthoigian']
                                                                          .toString() +
                                                                      's'),
                                                                ),
                                                                subtitle: Text(
                                                                  (documentHistory3[
                                                                              'thoigian']
                                                                          as Timestamp)
                                                                      .toDate()
                                                                      .toString(),
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
                                                                title: Center(
                                                                  child: Text('Điểm: ' +
                                                                      documentHistory4[
                                                                              'diem']
                                                                          .toString() +
                                                                      '      Thời gian: ' +
                                                                      documentHistory4[
                                                                              'tongthoigian']
                                                                          .toString() +
                                                                      's'),
                                                                ),
                                                                subtitle: Text(
                                                                  (documentHistory4[
                                                                              'thoigian']
                                                                          as Timestamp)
                                                                      .toDate()
                                                                      .toString(),
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
                                                                title: Center(
                                                                  child: Text('Điểm: ' +
                                                                      documentHistory5[
                                                                              'diem']
                                                                          .toString() +
                                                                      '      Thời gian: ' +
                                                                      documentHistory5[
                                                                              'tongthoigian']
                                                                          .toString() +
                                                                      's'),
                                                                ),
                                                                subtitle: Text(
                                                                  (documentHistory5[
                                                                              'thoigian']
                                                                          as Timestamp)
                                                                      .toDate()
                                                                      .toString(),
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
