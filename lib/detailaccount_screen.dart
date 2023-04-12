import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../setting_screen.dart';
import 'login_screen.dart';

class detailaccount_screen extends StatefulWidget {
  const detailaccount_screen({super.key});

  @override
  State<detailaccount_screen> createState() => _detailaccount_screenState();
}

class _detailaccount_screenState extends State<detailaccount_screen> {
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
                  final document = snapshot.data!.docs[0];
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
                                        document['luotthachdau'].toString(),
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
                          //avata bu
                          Column(
                            children: [
                              Material(
                                shape: CircleBorder(),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.yellow, width: 8),
                                    shape: BoxShape.circle,
                                  ),
                                  width: 100,
                                  height: 100,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://staticg.sportskeeda.com/editor/2022/09/71751-16644793436395-1920.jpg"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //ten nguoi choi
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              document['name'],
                              textScaleFactor: 2,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          //thong tin nguoi choi
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              height: 230,
                              width: 370,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(30),
                                child: Column(
                                  children: [
                                    //thong tin email
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.insert_drive_file,
                                          color:
                                              Color.fromARGB(255, 12, 204, 57),
                                        ),
                                        Text(
                                          'Email: ' +
                                              document['email'].toString(),
                                          textScaleFactor: 1.5,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    //thong tin diem
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          'Điểm: ' +
                                              document['diemRank'].toString(),
                                          textScaleFactor: 1.5,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    //thong tin choi don
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.blue,
                                        ),
                                        Text(
                                          'Hạng:' + indexDetail.toString(),
                                          textScaleFactor: 1.5,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    //thong tin thach dau
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          'Hạng thách đấu:' +
                                              indexDetail.toString(),
                                          textScaleFactor: 1.5,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // nút đăng xuất
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 0, 0),
                                  minimumSize: Size(150, 50),
                                  side: BorderSide(
                                    width: 1.0,
                                  ),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('ĐĂNG XUẤT'),
                                        content:
                                            Text('Bạn muốn có muốn đăng xuất?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Huỷ'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen(),
                                                ),
                                              );
                                            },
                                            child: Text('OK'),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'Đăng xuất',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
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
