import 'package:doan/addfriend_screen.dart';
import 'package:doan/notify_screen/tab_screen/chart.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Tap2Screen extends StatefulWidget {
  const Tap2Screen({Key? key}) : super(key: key);

  @override
  State<Tap2Screen> createState() => _Tap2State();
}

class MyController extends GetxController {
  var name = "Doanh thu theo ngày".obs;
  var optionColorA = true;
  var optionColorB = false;
  var optionColorC = false;
  var optionColorD = false;

  changeName(String s) {
    name.value = s;
  }

  colorA() {
    optionColorA = true;
    optionColorB = false;
    optionColorC = false;
    optionColorD = false;
    update();
  }

  colorB() {
    optionColorA = false;
    optionColorB = true;
    optionColorC = false;
    optionColorD = false;
    update();
  }
}

class _Tap2State extends State<Tap2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Tabbar(context),
    );
    ;
  }

  Widget Tabbar(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 222, 222, 222)),
              child: ButtonsTabBar(
                contentPadding: EdgeInsets.symmetric(horizontal: 25),
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                unselectedBackgroundColor: Color.fromARGB(255, 222, 222, 222),
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 101, 7),
                ),
                tabs: [
                  Tab(
                    text: 'Hôm nay',
                  ),
                  Tab(
                    text: 'Phân tích',
                  ),
                ],
              ),
            ),
          ]),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                content_1(context),
                content_2(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget content_1(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              view(),
              SizedBox(
                height: 20,
              ),
              support_viewer(),
            ],
          )),
    );
  }

  Widget content_2(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
        child: Column(
          children: [
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(w + 50, 50),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  bottomMenu(context);
                },
                child: Container(
                  width: w / 100 * 80,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey, // Text colour here
                        width: 1.0, // Underline width
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.grey[800],
                        size: 25,
                      ),
                      Text(
                        ' Tháng trước ',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.grey[800],
                        size: 25,
                      ),
                    ],
                  ),
                )),
            Tab(
              height: h / 100 * 60,
              child: content_2_1(),
            )
          ],
        ));
  }

  Widget content_2_1() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    Icon eye = Icon(
      Icons.remove_red_eye_outlined,
      size: 25,
      color: Colors.green[800],
    );
    Icon person = Icon(
      Icons.person_add_alt_outlined,
      size: 25,
      color: Colors.green[800],
    );
    Icon shuffle = Icon(
      Icons.shuffle,
      size: 25,
      color: Colors.green[800],
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: w / 100 * 93,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: container1_conten2(),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                  width: w / 100 * 93,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const ExpansionTile(
                    leading: Icon(
                      Icons.list_alt,
                      color: Color.fromRGBO(56, 142, 60, 1),
                      size: 30,
                    ),
                    collapsedIconColor: Color.fromRGBO(0, 0, 0, 1),
                    title: Text(
                      'Doanh thu theo kênh',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    children: <Widget>[
                      ListTile(
                        textColor: Colors.black,
                        title: Text(
                          'Cửa hàng',
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: Text(
                          '75.000',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ListTile(
                        textColor: Colors.black,
                        title: Text(
                          'Bán hàng Online',
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: Text(
                          '0',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                  width: w / 100 * 93,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: button(eye, 'Lượt khách xem cửa hàng', '0', '')),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                  width: w / 100 * 93,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: button(person, 'Khách hàng mới', '1', '')),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                  width: w / 100 * 93,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: button(
                      shuffle, 'Giá trị trung bình đơn', '37.500', ' ₫')),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                  width: w / 100 * 93,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child:
                      button(shuffle, 'Trung bình đơn/khách hàng', '2.00', '')),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget container1_conten2() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    bool optionColorA = true;
    bool optionColorB = false;
    bool optionColorC = false;
    bool optionColorD = false;
    Color colorTrue = Color.fromARGB(232, 11, 141, 54);
    Color colorFalse = Color.fromRGBO(238, 238, 238, 1);
    MyController controller = MyController();

    //controller.name = controller.changeName(a);
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  maximumSize: Size(w / 100 * 42, w / 100 * 30),
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  side: BorderSide(
                    width: 2,
                    color: (controller.optionColorA.obs == true)
                        ? colorTrue
                        : colorFalse,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 165, 214, 167),
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.trending_up_outlined,
                              color: Colors.green[700],
                              size: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Doanh Thu',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '75000' + ' ₫',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        )
                      ],
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    controller.colorA();
                  });
                  //context1 = 'Doanh thu theo ngày'.obs;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  maximumSize: Size(w / 100 * 42, w / 100 * 30),
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  side: BorderSide(width: 2, color: colorTrue
                      //  (controller.optionColorB.obs == true)
                      //     ? colorTrue
                      //     : colorFalse,
                      ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(200, 56, 3, 0.258),
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.list_alt_sharp,
                              color: Color.fromARGB(255, 190, 63, 17),
                              size: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Đơn Hàng',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        )
                      ],
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    controller.colorB();
                  });
                  //context1 = 'Đơn hàng thành công theo ngày'.obs;
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  maximumSize: Size(w / 100 * 42, w / 100 * 30),
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  side: BorderSide(
                    width: 2,
                    color: (optionColorA == true) ? colorTrue : colorFalse,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(144, 202, 249, 1),
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.person_outline_outlined,
                              color: Colors.blue,
                              size: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Khách Hàng',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '1',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        )
                      ],
                    ),
                  ],
                ),
                onPressed: () {
                  //context1 = 'Khách hàng đặt đơn theo ngày'.obs;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  maximumSize: Size(w / 100 * 42, w / 100 * 30),
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  side: BorderSide(
                    width: 2,
                    color: (optionColorA == true) ? colorTrue : colorFalse,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(239, 154, 154, 1),
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.cancel_presentation_rounded,
                              color: Colors.red,
                              size: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Đơn Hủy',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '0' + ' ₫',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        )
                      ],
                    ),
                  ],
                ),
                onPressed: () {
                  // context1 = a.obs;
                  controller.name = '0'.obs;
                  print(controller.name);
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                controller.name.toString(),
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Text(
                '   Tháng nay',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Text(
                '   Tháng trước',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: w / 100 * 85,
                  height: h / 100 * 50,
                  child: chartA(context),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget button(Icon icon, context1, context2, d) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(100)),
                    child:
                        Padding(padding: const EdgeInsets.all(5), child: icon),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    context1,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    context2 + d,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//Widget tap hôm nay
  Widget view() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  Text(
                    'Số lượng khách xem cửa hàng',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                container_view(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Text(
                    '   Hôm nay',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Text(
                    '   Hôm qua',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: w / 100 * 85,
                      height: h / 100 * 50,
                      child: chartA(context),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget support_viewer() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Row(
                children: [
                  Text(
                    'Hỗ Trợ khách đang xem cửa hàng',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size((w / 100 * 85), (w / 100 * 15)),
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      width: 2,
                      color: Color.fromARGB(232, 11, 141, 54),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Gửi danh thiếp',
                    style: TextStyle(
                        color: Color.fromARGB(232, 11, 141, 54),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget container_view() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      width: w / 100 * 85,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(13),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red[100],
                                  borderRadius: BorderRadius.circular(100)),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.red,
                                  size: 35,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Đang xem',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(13),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  borderRadius: BorderRadius.circular(100)),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  Icons.done_all,
                                  color: Colors.green,
                                  size: 35,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Đã xem hôm nay',
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  bottomMenu(context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    int? _value = 1;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext c) {
        return Container(
          width: w,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: w,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Lọc theo thời gian',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey, // Text colour here
                        width: 1.0, // Underline width
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Hôm nay',
                        style: TextStyle(color: Colors.grey[700], fontSize: 22),
                      ),
                      Spacer(),
                      Radio(
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {}
                          return Colors.green;
                        }),
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(
                            () {
                              _value = value;
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey, // Text colour here
                        width: 1.0, // Underline width
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Tuần này',
                        style: TextStyle(color: Colors.grey[700], fontSize: 22),
                      ),
                      Spacer(),
                      Radio(
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {}
                          return Colors.green;
                        }),
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(
                            () {
                              _value = value;
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey, // Text colour here
                        width: 1.0, // Underline width
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Tháng này',
                        style: TextStyle(color: Colors.grey[700], fontSize: 22),
                      ),
                      Spacer(),
                      Radio(
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {}
                          return Colors.green;
                        }),
                        value: 3,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(
                            () {
                              _value = value;
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey, // Text colour here
                        width: 1.0, // Underline width
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Tuần trước',
                        style: TextStyle(color: Colors.grey[700], fontSize: 22),
                      ),
                      Spacer(),
                      Radio(
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {}
                          return Colors.green;
                        }),
                        value: 4,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(
                            () {
                              _value = value;
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey, // Text colour here
                        width: 1.0, // Underline width
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Tháng trước',
                        style: TextStyle(color: Colors.grey[700], fontSize: 22),
                      ),
                      Spacer(),
                      Radio(
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {}
                          return Colors.green;
                        }),
                        value: 5,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(
                            () {
                              _value = value;
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey, // Text colour here
                        width: 1.0, // Underline width
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Thời gian khác',
                        style: TextStyle(color: Colors.grey[700], fontSize: 22),
                      ),
                      Spacer(),
                      Radio(
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {}
                          return Colors.green;
                        }),
                        value: 6,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(
                            () {
                              _value = value;
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
