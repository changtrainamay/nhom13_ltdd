import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tap1Screen extends StatefulWidget {
  const Tap1Screen({Key? key}) : super(key: key);

  @override
  State<Tap1Screen> createState() => _Tap1State();
}

class _Tap1State extends State<Tap1Screen> {
  TextStyle thu = TextStyle(
      color: Color.fromARGB(255, 1, 117, 40), fontWeight: FontWeight.w600);
  TextStyle chi = TextStyle(
      color: Color.fromARGB(255, 241, 65, 0), fontWeight: FontWeight.w600);
  TextStyle grey = TextStyle(color: Color.fromARGB(255, 129, 125, 125));
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
      length: 3,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(top: 5, left: 5, bottom: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(147, 217, 216, 216)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 222, 222, 222)),
                  child: ButtonsTabBar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    unselectedBackgroundColor:
                        Color.fromARGB(255, 222, 222, 222),
                    unselectedLabelStyle: TextStyle(color: Colors.black),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Color.fromARGB(255, 0, 101, 7),
                    ),
                    tabs: [
                      const Tab(
                        text: 'Hôm nay',
                      ),
                      const Tab(
                        text: 'Tháng này',
                      ),
                      const Tab(
                        text: 'Tháng trước',
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                content_1(context),
                content_2(context),
                content_1(context)
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: w,
            height: (w / 100 * 15 + 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size((w / 100 * 15), (w / 100 * 15)),
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      width: 3,
                      color: Color.fromARGB(232, 11, 141, 54),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: 30,
                        color: Colors.green[700],
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size((w / 100 * 15), (w / 100 * 15)),
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      width: 3,
                      color: Color.fromARGB(232, 11, 141, 54),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_sharp,
                        size: 30,
                        color: Colors.green[700],
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size((w / 100 * 60), 60),
                    backgroundColor: Color.fromARGB(232, 11, 141, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      Text(
                        "Tải báo cáo",
                        style: TextStyle(fontSize: 22.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget content_1(BuildContext context) => SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bạn chưa có dữ liệu bán hàng nào được ghi lại.',
                style: TextStyle(color: Colors.grey[900], fontSize: 17),
              )
            ],
          ),
          SizedBox(height: 20),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size((250), 60),
              backgroundColor: Color.fromARGB(232, 11, 141, 54),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Tạo đơn hàng",
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            ),
          ),
        ]),
      );

  Widget content_2(BuildContext context) => SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          const Text('Số dư: ',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          Text(
                            '161.000',
                            style: thu,
                          )
                        ]),
                        TextButton.icon(
                            style: TextButton.styleFrom(
                              primary: Color.fromARGB(255, 79, 104, 205),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.signal_cellular_alt_outlined,
                                size: 16),
                            label: const Text('Báo cáo'))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width / 2.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(147, 217, 216, 216)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.payment,
                                    size: 16,
                                    color: Color.fromARGB(255, 241, 65, 0),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Column(
                                  children: [
                                    const Text('Tổng chi'),
                                    const Text(
                                      '200.000đ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 241, 65, 0),
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width / 2.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromARGB(147, 217, 216, 216)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      const Icon(
                                        Icons.payment,
                                        color: Color.fromARGB(255, 1, 117, 40),
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Column(
                                      children: [
                                        const Text('Tổng thu'),
                                        const Text(
                                          '361.000đ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 1, 117, 40),
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              DataTable(
                  columnSpacing: 10,
                  headingRowHeight: 30,
                  dataRowColor: MaterialStateColor.resolveWith(
                      (states) => Color.fromARGB(255, 255, 255, 255)),
                  headingTextStyle: TextStyle(color: Colors.grey),
                  columns: [
                    DataColumn(label: Text('')),
                    DataColumn(label: Text('Chi'), numeric: true),
                    DataColumn(label: Text('Thu'), numeric: true),
                  ],
                  rows: [
                    DataRow(
                        color: MaterialStateColor.resolveWith(
                            (states) => Color.fromARGB(255, 234, 234, 234)),
                        cells: [
                          DataCell(Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  margin: EdgeInsets.only(
                                      right: 10, top: 10, bottom: 10),
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '21',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Hôm qua',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    Text('Tháng 2/23',
                                        style: TextStyle(fontSize: 12))
                                  ],
                                )
                              ],
                            ),
                          )),
                          DataCell(Text(
                            '200.000',
                            style: TextStyle(
                                color: Color.fromARGB(255, 241, 65, 0),
                                fontWeight: FontWeight.w600),
                          )),
                          DataCell(Text(
                            '361.000',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 117, 40),
                                fontWeight: FontWeight.w600),
                          )),
                        ]),
                    DataRow(cells: [
                      DataCell(Container(
                        constraints:
                            BoxConstraints(minWidth: 100, maxWidth: 140),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bán hàng',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 129, 125, 125)),
                            ),
                            Text(
                              'Thanh toán đơn hàng',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )),
                      DataCell(Text('')),
                      DataCell(Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '25.000',
                            style: thu,
                          ),
                          Text(
                            'Tiền mặt',
                            overflow: TextOverflow.ellipsis,
                            style: grey,
                          )
                        ],
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                        constraints:
                            BoxConstraints(minWidth: 100, maxWidth: 140),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bán hàng',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 129, 125, 125)),
                            ),
                            Text(
                              'Thanh toán đơn hàng',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )),
                      DataCell(Text('')),
                      DataCell(Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '36.000',
                            style: thu,
                          ),
                          Text(
                            'Tiền mặt',
                            overflow: TextOverflow.ellipsis,
                            style: grey,
                          )
                        ],
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('Tiền công', style: grey)],
                      )),
                      DataCell(Text('')),
                      DataCell(Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '300.000',
                            style: thu,
                          ),
                          Text(
                            'Tiền mặt',
                            overflow: TextOverflow.ellipsis,
                            style: grey,
                          )
                        ],
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ăn uống',
                            style: TextStyle(
                                color: Color.fromARGB(255, 129, 125, 125)),
                          ),
                        ],
                      )),
                      DataCell(Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '200.000',
                            style: chi,
                          ),
                          Text(
                            'Tiền mặt',
                            overflow: TextOverflow.ellipsis,
                            style: grey,
                          )
                        ],
                      )),
                      DataCell(Text('')),
                    ]),
                  ])
            ],
          ),
        ),
      );
}
