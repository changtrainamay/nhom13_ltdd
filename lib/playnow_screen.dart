import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan/field_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../home_screen.dart';
import '../setting_screen.dart';

class PlayNowScreen extends StatefulWidget {
  int linhvuc;
  PlayNowScreen({required this.linhvuc});
  @override
  State<PlayNowScreen> createState() => _PlayNowScreenState(linhvuc);
}

class _PlayNowScreenState extends State<PlayNowScreen> {
  bool firstload = true;
  final loginUser = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int index = 0; //vị trí câu hỏi trên firebase

  int causo = 1; // hiển thị câu số mấy
  late String dapan;

  late String dapandung; //đáp án đúng
  int diem = 0; //điểm
  int socauhoi = 19; // số lượng câu hỏi
  late int linhvuc;
  int click = 0; //hạn chế số lần bấm trả lời trong 1 câu
  int clickHelp = 0; //hạn chế số lần bấm quyền 50/50 trong 1 câu
  //nếu đag chơi mà out thì trừ 2 lại
  int tien = 0;
  double diemRank = 0;
  //đổi màu ô trả lời
  bool optionColorA = true;
  bool optionColorB = true;
  bool optionColorC = true;
  bool optionColorD = true;
  Color colorTamA = Colors.white;
  Color colorTamB = Colors.white;
  Color colorTamC = Colors.white;
  Color colorTamD = Colors.white;
  Color colorRight = Color.fromARGB(238, 101, 239, 94);
  Color colorWrong = Colors.red;
  Color colorHelp1 = Color.fromARGB(255, 152, 159, 165);

  //đồng hồ
  var percent = 0.0;
  late Timer timer;
  var percent3Tam = 0.0; //lưu lại thời gian kết thúc
  _finish() {
    timer.cancel();
    percent = 0.0;
    timer2 = Timer.periodic(Duration(milliseconds: 1000), (_) {
      setState(() {
        percent2 += 1;
        if (percent2 >= 2) {
          timer2.cancel();
          percent2 = 0.0;
          percent3Tam = percent3;
          var ketqua = FirebaseFirestore.instance.collection('resultPlayNow');
          ketqua.add({
            'tongthoigian': percent3Tam.toInt(),
            'email': loginUser.email.toString(),
            'diem': diem,
            'thoigian': DateTime.now()
          });

          timer3.cancel();
          percent3 = 0.0;
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Kết thúc'),
                content: Row(
                  children: [
                    Text('Điểm: ' + diem.toString()),
                    Text('  Thời gian hoàn thành: ' +
                        percent3Tam.toInt().toString() +
                        's'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      timer.cancel();
                      index = 0;
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Text('OK'),
                  )
                ],
              );
            },
          );
        }
      });
    });
  }

//đồng hồ
  Future<void> _startTime() async {
    clickHelp = 0;
    click = 0;
    optionColorA = true;
    optionColorB = true;
    optionColorC = true;
    optionColorD = true;
    timer = Timer.periodic(
      Duration(milliseconds: 1000),
      (_) {
        setState(
          () {
            percent += 1;
            if (percent >= 20) {
              timer.cancel();
              percent = 0.0;
              _startTimeOut();
            }
          },
        );
      },
    );
  }

  //đồng hồ tổng
  var percent3 = 0.0;

  late Timer timer3;
  Future<void> totalTime() async {
    timer3 = Timer.periodic(
      Duration(milliseconds: 1000),
      (_) {
        setState(
          () {
            percent3 += 1;
          },
        );
      },
    );
  }

  // đếm 2s để qua câu khác
  var percent2 = 0.0;
  late Timer timer2;
  _startTimeOut() {
    timer2 = Timer.periodic(Duration(milliseconds: 1000), (_) {
      setState(() {
        percent2 += 1;

        if (percent2 >= 2) {
          timer2.cancel();
          percent2 = 0.0;
          if (index == socauhoi) {
            _finish();
          } else {
            index++;
            causo++;
            setState(() {
              _startTime();
            });
          }
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detail = FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: loginUser.email);

    switch (linhvuc) {
      case 1:
        cauhoi = FirebaseFirestore.instance
            .collection('questions')
            .where('linhvuc', isEqualTo: linhvuc)
            .orderBy('id');
        break;
      case 2:
        cauhoi = FirebaseFirestore.instance
            .collection('questions')
            .where('linhvuc', isEqualTo: linhvuc)
            .orderBy('id');
        break;
      case 3:
        cauhoi = FirebaseFirestore.instance
            .collection('questions')
            .where('linhvuc', isEqualTo: linhvuc)
            .orderBy('id');
        break;
      case 4:
        cauhoi = FirebaseFirestore.instance
            .collection('questions')
            .where('linhvuc', isEqualTo: linhvuc)
            .orderBy('id');
        break;
    }
  }

  late Query<Map<String, dynamic>> cauhoi;
  _PlayNowScreenState(int linhvuc) {
    this.linhvuc = linhvuc;
  }
  late Query<Map<String, dynamic>> detail;
  int indexDetail = 0;

  @override
  Widget build(BuildContext context) {
    if (firstload == true) {
      _startTime();
      totalTime();
      firstload = false;
    }
    return SizedBox(
      height: 250,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Expanded(
              child: StreamBuilder(
                stream: cauhoi.snapshots(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    //truy xuất đáp án đúng
                    final documentCauhoi = snapshot.data!.docs[index];
                    dapan = documentCauhoi['dapan'];
                    switch (dapan) {
                      case 'a':
                        dapandung = documentCauhoi['a'];
                        break;
                      case 'b':
                        dapandung = documentCauhoi['b'];
                        break;
                      case 'c':
                        dapandung = documentCauhoi['c'];
                        break;
                      case 'd':
                        dapandung = documentCauhoi['d'];
                        break;
                    }

                    return StreamBuilder(
                      stream: detail.snapshots(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          final documentDetail =
                              snapshot.data!.docs[indexDetail];
                          final updateDetail = FirebaseFirestore.instance
                              .collection('users')
                              .doc(documentDetail.id);
                          return ListView(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            color: Colors.red,
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text('Thông báo'),
                                                    content: Text(
                                                        'Nếu thoát bạn sẽ không nhận được phần thưởng!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('Huỷ'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          timer.cancel();
                                                          index = 0;
                                                          timer3.cancel();

                                                          //trừ điểm với tiền nếu thoát
                                                          updateDetail.update({
                                                            'tien':
                                                                documentDetail[
                                                                        'tien'] -
                                                                    tien
                                                          });

                                                          updateDetail.update({
                                                            'diemRank':
                                                                documentDetail[
                                                                        'diemRank'] -
                                                                    diemRank
                                                          });
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  HomeScreen(),
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
                                            icon: Icon(Icons.cancel),
                                            iconSize: 45,
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
                                                documentDetail['tien']
                                                    .toString(),
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

                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        //điểm
                                        Column(
                                          children: [
                                            Text(
                                              diem.toString() + '/200',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                        //thời gian trả lời câu hỏi
                                        Column(
                                          children: [
                                            CircularPercentIndicator(
                                              circularStrokeCap:
                                                  CircularStrokeCap.round,
                                              percent: percent / 20,
                                              animation: true,
                                              animateFromLastPercent: true,
                                              radius: 25,
                                              lineWidth: 5,
                                              progressColor: Colors.black,
                                              center: Text(
                                                "$percent",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //Câu hỏi
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        height: 170,
                                        width: 300,
                                        child: Column(
                                          children: [
                                            Text(
                                              'Câu ' + causo.toString(),
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              documentCauhoi['cauhoi'],
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.black,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  //đáp án A
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            if (click == 0) {
                                              click++;
                                              optionColorA = false;

                                              if (dapandung ==
                                                  documentCauhoi['a']) {
                                                //cộng điểm nếu đúng
                                                diem += 10;
                                                //đổi màu
                                                colorTamA = colorRight;
                                                //cộng tiền
                                                tien++;
                                                updateDetail.update({
                                                  'tien':
                                                      documentDetail['tien'] + 1
                                                });
                                                //cộng điểm xếp hạng
                                                diemRank += 1;
                                                updateDetail.update({
                                                  'diemRank': documentDetail[
                                                          'diemRank'] +
                                                      1
                                                });
                                              } else {
                                                //đổi màu
                                                colorTamA = colorWrong;
                                              }

                                              if (index == socauhoi) {
                                                timer.cancel();
                                                percent = 0.0;
                                                _finish();
                                              } else {
                                                timer.cancel();
                                                percent = 0.0;
                                                _startTimeOut();
                                              }
                                            }
                                          },
                                          child: Text(
                                            documentCauhoi['a'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor:
                                                (optionColorA == false)
                                                    ? colorTamA
                                                    : Colors.white,
                                            minimumSize: Size(300, 60),
                                            side: BorderSide(
                                              width: 2,
                                            ),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //đáp án B
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            if (click == 0) {
                                              click++;
                                              optionColorB = false;
                                              //cộng điểm nếu đúng
                                              if (dapandung ==
                                                  documentCauhoi['b']) {
                                                diem += 10;
                                                colorTamB = colorRight;
                                                //cộng tiền
                                                tien++;
                                                updateDetail.update({
                                                  'tien':
                                                      documentDetail['tien'] + 1
                                                });
                                                //cộng điểm xếp hạng
                                                diemRank += 1;
                                                updateDetail.update({
                                                  'diemRank': documentDetail[
                                                          'diemRank'] +
                                                      1
                                                });
                                              } else {
                                                colorTamB = colorWrong;
                                              }

                                              if (index == socauhoi) {
                                                timer.cancel();
                                                percent = 0.0;
                                                _finish();
                                              } else {
                                                timer.cancel();
                                                percent = 0.0;
                                                _startTimeOut();
                                              }
                                            }
                                          },
                                          child: Text(
                                            documentCauhoi['b'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor:
                                                (optionColorB == false)
                                                    ? colorTamB
                                                    : Colors.white,
                                            minimumSize: Size(300, 60),
                                            side: BorderSide(
                                              width: 2,
                                            ),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //đáp án C
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            if (click == 0) {
                                              click++;
                                              optionColorC = false;
                                              //cộng điểm nếu đúng
                                              if (dapandung ==
                                                  documentCauhoi['c']) {
                                                diem += 10;
                                                colorTamC = colorRight;
                                                //cộng tiền
                                                tien++;
                                                updateDetail.update({
                                                  'tien':
                                                      documentDetail['tien'] + 1
                                                });
                                                //cộng điểm xếp hạng
                                                diemRank += 1;
                                                updateDetail.update({
                                                  'diemRank': documentDetail[
                                                          'diemRank'] +
                                                      1
                                                });
                                              } else {
                                                colorTamC = colorWrong;
                                              }

                                              if (index == socauhoi) {
                                                timer.cancel();
                                                percent = 0.0;
                                                _finish();
                                              } else {
                                                timer.cancel();
                                                percent = 0.0;
                                                _startTimeOut();
                                              }
                                            }
                                          },
                                          child: Text(
                                            documentCauhoi['c'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor:
                                                (optionColorC == false)
                                                    ? colorTamC
                                                    : Colors.white,
                                            minimumSize: Size(300, 60),
                                            side: BorderSide(
                                              width: 2,
                                            ),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //đáp án D
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            if (click == 0) {
                                              click++;
                                              optionColorD = false;
                                              //cộng điểm nếu đúng
                                              if (dapandung ==
                                                  documentCauhoi['d']) {
                                                diem += 10;
                                                colorTamD = colorRight;
                                                //cộng tiền
                                                tien++;
                                                updateDetail.update({
                                                  'tien':
                                                      documentDetail['tien'] + 1
                                                });
                                                //cộng điểm xếp hạng
                                                diemRank += 1;
                                                updateDetail.update({
                                                  'diemRank': documentDetail[
                                                          'diemRank'] +
                                                      1
                                                });
                                              } else {
                                                colorTamD = colorWrong;
                                              }

                                              if (index == socauhoi) {
                                                timer.cancel();
                                                percent = 0.0;
                                                _finish();
                                              } else {
                                                timer.cancel();
                                                percent = 0.0;
                                                _startTimeOut();
                                              }
                                            }
                                          },
                                          child: Text(
                                            documentCauhoi['d'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor:
                                                (optionColorD == false)
                                                    ? colorTamD
                                                    : Colors.white,
                                            minimumSize: Size(300, 60),
                                            side: BorderSide(
                                              width: 2,
                                            ),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(17),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Ink.image(
                                            image: AssetImage('images/1.jpg'),
                                            height: 50,
                                            width: 50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '1',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(17),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Ink.image(
                                            image: AssetImage('images/1.jpg'),
                                            height: 50,
                                            width: 50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '1',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(17),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Ink.image(
                                            image: AssetImage('images/1.jpg'),
                                            height: 50,
                                            width: 50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '1',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      // trợ giúp 50 50
                                      Padding(
                                        padding: const EdgeInsets.all(17),
                                        child: InkWell(
                                          onTap: () {
                                            if (documentDetail['help5050'] >
                                                    0 &&
                                                clickHelp == 0) {
                                              clickHelp++;
                                              updateDetail.update({
                                                'help5050':
                                                    documentDetail['help5050'] -
                                                        1
                                              });
                                              switch (
                                                  documentCauhoi['trogiup1a']) {
                                                case 'a':
                                                  optionColorA = false;
                                                  colorTamA = colorHelp1;
                                                  break;
                                                case 'b':
                                                  optionColorB = false;
                                                  colorTamB = colorHelp1;
                                                  break;
                                                case 'c':
                                                  optionColorC = false;
                                                  colorTamC = colorHelp1;
                                                  break;
                                                case 'd':
                                                  optionColorD = false;
                                                  colorTamD = colorHelp1;
                                                  break;
                                              }
                                              switch (
                                                  documentCauhoi['trogiup1b']) {
                                                case 'a':
                                                  optionColorA = false;
                                                  colorTamA = colorHelp1;
                                                  break;
                                                case 'b':
                                                  optionColorB = false;
                                                  colorTamB = colorHelp1;
                                                  break;
                                                case 'c':
                                                  optionColorC = false;
                                                  colorTamC = colorHelp1;
                                                  break;
                                                case 'd':
                                                  optionColorD = false;
                                                  colorTamD = colorHelp1;
                                                  break;
                                              }
                                            }
                                          },
                                          child: Ink.image(
                                            image:
                                                AssetImage('images/5050.png'),
                                            height: 80,
                                            width: 80,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: 25,
                                                  width: 25,
                                                  child: Text(
                                                    documentDetail['help5050']
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // trợ giúp
                                ],
                              )
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
