import 'package:doan/addfriend_screen.dart';
import 'package:flutter/material.dart';

import '../setting_screen.dart';

class Listfriend_Screen extends StatefulWidget {
  const Listfriend_Screen({super.key});

  @override
  State<Listfriend_Screen> createState() => _Listfriend_ScreenState();
}

class _Listfriend_ScreenState extends State<Listfriend_Screen> {
  List<Station> stations = [
    Station(1, 'Messi', true),
    Station(2, 'Messi', false),
    Station(3, 'Messi', false),
    Station(4, 'Messi', true),
    Station(5, 'Messi', true),
    Station(6, 'Messi', false),
    Station(7, 'Messi', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                  ),
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
                      width: 300,
                      child: Text('á')),
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
                                builder: (context) => addfriendScreen(),
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
        ),
      ),
    );
  }
}

class Station {
  int id;
  String name;
  bool status;
  Station(this.id, this.name, this.status);
}
