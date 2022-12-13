import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_screen.dart';
import '../setting_screen.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({Key? key}) : super(key: key);

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // nút bỏ cuộc
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
                                  content: Text('Bạn muốn bỏ cuộc?'),
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
                                                  HomeScreen(),
                                            ),
                                          );
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
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
                          side: BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.heart_broken,
                          color: Colors.red,
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
                  //thachdau
                  Column(
                    children: [
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.confirmation_num,
                          color: Colors.blue,
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
                  //coin
                  Column(
                    children: [
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
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
              Row(
                children: [
                  //avarta mình
                  Column(
                    children: [
                      Container(
                        width: 70,
                        height: 50,
                        child: CircleAvatar(
                          backgroundColor: Color(0xffFDCF09),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://staticg.sportskeeda.com/editor/2022/09/71751-16644793436395-1920.jpg"),
                          ),
                        ),
                      ),
                      Container(
                        child: Text('You',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                  //điểm mình
                  Text(
                    '0/100',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  //điểm người ta
                  Text(
                    '0/100',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  //avarta người ta
                  Column(
                    children: [
                      Container(
                        width: 70,
                        height: 50,
                        child: CircleAvatar(
                          backgroundColor: Color(0xffFDCF09),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://staticg.sportskeeda.com/editor/2022/09/71751-16644793436395-1920.jpg"),
                          ),
                        ),
                      ),
                      Container(
                        child: Text('Messi',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //thời gian trả lời câu hỏi
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '20s',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //Câu hỏi
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 170,
                    width: 300,
                    child: Text(
                      'Question 1:',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'adadaaaaadad',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(300, 60),
                        side: BorderSide(
                          width: 2,
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    )
                  ],
                ),
              ),
              //đáp án B
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'adadaaaaadad',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(300, 60),
                        side: BorderSide(
                          width: 2,
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    )
                  ],
                ),
              ),
              //đáp án C
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'adadaaaaadad',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(300, 60),
                        side: BorderSide(
                          width: 2,
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    )
                  ],
                ),
              ),
              //đáp án D
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'adadaaaaadad',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(300, 60),
                        side: BorderSide(
                          width: 2,
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
