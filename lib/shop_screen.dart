import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../setting_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
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
                  final document = snapshot.data!.docs[indexDetail];
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
                          // tro lai
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

                          Container(
                            child: Center(
                              child: Text(
                                'CỬA HÀNG',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          //cac tro giup
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/5050.png')),
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 60,
                                                child: Text(
                                                  document['help5050']
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //nut mua
                                        Row(
                                          children: [
                                            //coin
                                            Column(
                                              children: [
                                                OutlinedButton.icon(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: BorderSide(
                                                        color: Colors.black),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.attach_money,
                                                    color: Colors.yellow,
                                                  ),
                                                  label: Text(
                                                    '5',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            OutlinedButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 118, 233, 122),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              onPressed: () {
                                                if (document['tien'] >= 5) {
                                                  final up = FirebaseFirestore
                                                      .instance
                                                      .collection('users')
                                                      .doc(document.id);

                                                  up.update({
                                                    'tien': document['tien'] - 5
                                                  });
                                                  up.update({
                                                    'help5050':
                                                        document['help5050'] + 1
                                                  });
                                                }
                                              },
                                              child: Text(
                                                'Mua',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 230, 3)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                    AssetImage('images/1.jpg')),
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        //nut mua
                                        Row(
                                          children: [
                                            //coin
                                            Column(
                                              children: [
                                                OutlinedButton.icon(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: BorderSide(
                                                        color: Colors.black),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.attach_money,
                                                    color: Colors.yellow,
                                                  ),
                                                  label: Text(
                                                    '10',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            OutlinedButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 118, 233, 122),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                'Mua',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 230, 3)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Row(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 110,
                                                    child: Icon(
                                                      Icons.confirmation_num,
                                                      color: Colors.greenAccent,
                                                      size: 70,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    child: Text(
                                                      document['luotchoi']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        //nut mua
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                OutlinedButton.icon(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: BorderSide(
                                                        color: Colors.black),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.attach_money,
                                                    color: Colors.yellow,
                                                  ),
                                                  label: Text(
                                                    '10',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            OutlinedButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 118, 233, 122),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              onPressed: () {
                                                if (document['tien'] >= 10) {
                                                  final up = FirebaseFirestore
                                                      .instance
                                                      .collection('users')
                                                      .doc(document.id);

                                                  up.update({
                                                    'tien':
                                                        document['tien'] - 10
                                                  });
                                                  up.update({
                                                    'luotchoi':
                                                        document['luotchoi'] + 1
                                                  });
                                                }
                                              },
                                              child: Text(
                                                'Mua',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 230, 3)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                    AssetImage('images/1.jpg')),
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        //nut mua
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                OutlinedButton.icon(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: BorderSide(
                                                        color: Colors.black),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.attach_money,
                                                    color: Colors.yellow,
                                                  ),
                                                  label: Text(
                                                    '30',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            OutlinedButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 118, 233, 122),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                'Mua',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 230, 3)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
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
