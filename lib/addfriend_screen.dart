import 'package:flutter/material.dart';

import '../setting_screen.dart';

class addfriendScreen extends StatefulWidget {
  const addfriendScreen({super.key});

  @override
  State<addfriendScreen> createState() => _addfriendState();
}

class _addfriendState extends State<addfriendScreen> {
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
              // nút back
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
              //chu add
              Container(
                child: Column(
                  children: [
                    Text(
                      'Thêm bạn',
                      textScaleFactor: 2,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    //khung nhap ten
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Nhập tên người chơi',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //nut tim` kiem
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            child: Center(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size(140, 50),
                                  backgroundColor: Color(0xffFFFFAF),
                                  side: BorderSide(
                                    width: 1.0,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Tìm kiếm',
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
                      ),
                    ),
                    //khung noi dung
                    Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView(
                        children: [
                          //nguoi choi 1
                          Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text('1'),
                              ),
                              title: Center(
                                child: Text('Nguoi choi 1'),
                              ),
                              trailing: Icon(Icons.add),
                            ),
                          ),
                          //nguoi choi 2
                          Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text('1'),
                              ),
                              title: Center(
                                child: Text('Nguoi choi 2'),
                              ),
                              trailing: Icon(Icons.add),
                            ),
                          ),
                          //nguoi choi 3
                          Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text('1'),
                              ),
                              title: Center(
                                child: Text('Nguoi choi 3'),
                              ),
                              trailing: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
