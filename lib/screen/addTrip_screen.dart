import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class addTripScreen extends StatefulWidget {
  const addTripScreen({super.key});

  @override
  State<addTripScreen> createState() => _addTripScreenState();
}

class _addTripScreenState extends State<addTripScreen> {
  @override
  Widget build(BuildContext context) {
    double _fontSize() {
      double screenWidth = MediaQuery.of(context).size.width;
      if (screenWidth < 380) {
        return 20;
      } else if (screenWidth < 600) {
        return 25;
      } else if (screenWidth < 800) {
        return 27;
      } else {
        return 30;
      }
    }

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: w,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Tạo chuyến đi',
                              style: TextStyle(
                                  fontSize: _fontSize() - 6,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Mã: ' + 'ABC123',
                          style: TextStyle(
                            fontSize: _fontSize() - 6,
                            color: Colors.red[700],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.copy,
                            color: Colors.red[700],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 20),
                child: Row(
                  children: [
                    Text(
                      'TIÊU ĐỀ CHUYẾN ĐI CỦA BẠN',
                      style: TextStyle(
                          color: Colors.grey, fontSize: _fontSize() - 6),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 20),
                child: Row(
                  children: [
                    Text(
                      'ĐỊA ĐIỂM XUẤT PHÁT',
                      style: TextStyle(
                          color: Colors.grey, fontSize: _fontSize() - 6),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          icon: Icon(
                        Icons.location_on,
                        size: _fontSize() + 5,
                        color: Colors.green[700],
                      )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 20),
                child: Row(
                  children: [
                    Text(
                      'ĐỊA ĐIỂM KẾT THÚC',
                      style: TextStyle(
                          color: Colors.grey, fontSize: _fontSize() - 6),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          icon: Icon(
                        Icons.location_on,
                        size: _fontSize() + 5,
                        color: Colors.red[700],
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
