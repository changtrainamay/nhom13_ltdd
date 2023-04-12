import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan/field_screen.dart';
import 'package:doan/gg_maps/google_maps.dart';
import 'package:doan/listfriend_screen.dart';
import 'package:doan/notify_screen/notify_screen.dart';
import 'package:doan/rank_screen.dart';
import 'package:doan/tracking_location/maps.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../addfriend_screen.dart';
import '../detailaccount_screen.dart';
import '../playnow_screen.dart';
import '../setting_screen.dart';
import '../shop_screen.dart';
import 'challenge_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  final updateDetail = FirebaseFirestore.instance
                      .collection('users')
                      .doc(document.id);
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
                                  Material(
                                    shape: CircleBorder(),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(
                                            color: Colors.yellow, width: 5),
                                        shape: BoxShape.circle,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  detailaccount_screen(),
                                            ),
                                          );
                                        },
                                        child: Ink.image(
                                          image: NetworkImage(
                                              "https://staticg.sportskeeda.com/editor/2022/09/71751-16644793436395-1920.jpg"),
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.cover,
                                        ),
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
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MapSample(),
                                          ),
                                        );
                                      },
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
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MyApp(),
                                          ),
                                        );
                                      },
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
                                          builder: (context) => NotifyScreen(),
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
                          SizedBox(
                            height: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/logo.png'),
                              //choingay
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Container(
                                  child: Center(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Color(0xffFFFFAF),
                                        minimumSize: Size(170, 70),
                                        side: BorderSide(
                                          width: 1.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        if (document['luotchoi'] > 0) {
                                          updateDetail.update({
                                            'luotchoi': document['luotchoi'] - 1
                                          });
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FieldScreen(),
                                            ),
                                          );
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Thông báo'),
                                                content: Text(
                                                    'Bạn đã hết lượt chơi hãy vào cửa hàng để mua thêm'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Huỷ'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: Text(
                                        'Chơi ngay',
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
                              SizedBox(
                                height: 10,
                              ),
                              //thachdau
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Container(
                                  child: Center(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Color(0xffAFFFFA),
                                        minimumSize: Size(170, 70),
                                        side: BorderSide(
                                          width: 1.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChallengeScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Thách đấu',
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
                          SizedBox(
                            height: 170,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //addfr
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Listfriend_Screen()),
                                  );
                                },
                                icon: Icon(
                                  Icons.person_add_alt,
                                ),
                                color: Colors.blue,
                                iconSize: 40,
                                padding: EdgeInsets.all(10),
                              ),
                              //rating
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rankScreen()),
                                  );
                                },
                                icon: Icon(
                                  Icons.star_rate_rounded,
                                ),
                                color: Colors.yellow,
                                iconSize: 40,
                                padding: EdgeInsets.all(10),
                              ),
                              //shop
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShopScreen(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.storefront,
                                ),
                                color: Colors.red,
                                iconSize: 40,
                                padding: EdgeInsets.all(10),
                              ),
                              // history
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HistoryScreen(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.history,
                                ),
                                color: Colors.green,
                                padding: EdgeInsets.all(10),
                                iconSize: 40,
                              ),
                            ],
                          )
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
