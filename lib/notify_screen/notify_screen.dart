import 'package:doan/notify_screen/tab_screen/tap1.dart';
import 'package:doan/notify_screen/tab_screen/tap2.dart';
import 'package:doan/notify_screen/tab_screen/tap3.dart';
import 'package:doan/notify_screen/tab_screen/tap4.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({Key? key}) : super(key: key);

  @override
  State<NotifyScreen> createState() => _NotifyState();
}

class _NotifyState extends State<NotifyScreen> {
  TextStyle thu = TextStyle(
      color: Color.fromARGB(255, 1, 117, 40), fontWeight: FontWeight.w600);
  TextStyle chi = TextStyle(
      color: Color.fromARGB(255, 241, 65, 0), fontWeight: FontWeight.w600);
  TextStyle grey = TextStyle(color: Color.fromARGB(255, 129, 125, 125));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: appbar(),
      body: SafeArea(child: Tabbar(context)),
    );
  }

  AppBar appbar() {
    return AppBar(
      title: TextField(
        style: TextStyle(fontSize: 25),
        decoration: InputDecoration.collapsed(
            hintText: 'Tris Tins',
            hintStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Color.fromARGB(255, 0, 120, 0),
    );
  }

  Widget Tabbar(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                width: w,
                height: 50,
                child: TabBar(
                    indicatorColor: Color.fromARGB(255, 1, 117, 40),
                    unselectedLabelColor: Color.fromARGB(255, 104, 104, 104),
                    labelColor: Color.fromARGB(255, 1, 117, 40),
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: [
                      Tab(
                        text: 'Lãi lỗ',
                      ),
                      Tab(
                        text: 'Cửa hàng',
                      ),
                      Tab(
                        text: 'Kho hàng',
                      ),
                      Tab(
                        text: 'Thu chi',
                      ),
                    ]),
              ),
            ],
          ),
          // tap bar view
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: (h / 100 * 75),
                  width: w,
                  child: TabBarView(
                    children: [
                      //lãi lỗ
                      Container(
                        child: Tap1Screen(),
                      ),
                      //cửa hàng
                      Container(
                        child: Tap2Screen(),
                      ),
                      // kho hàng
                      Container(
                        child: Tap3Screen(),
                      ),
                      // thu chi
                      Container(
                        child: Tap4Screen(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
