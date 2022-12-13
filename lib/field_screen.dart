import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan/playnow_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_screen.dart';
import '../setting_screen.dart';

class FieldScreen extends StatefulWidget {
  const FieldScreen({Key? key}) : super(key: key);

  @override
  State<FieldScreen> createState() => _FieldScreenState();
}

class _FieldScreenState extends State<FieldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              //cac linh vuc
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlayNowScreen(
                                      linhvuc: 1,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Khoa học',
                                textScaleFactor: 2,
                                style: TextStyle(color: Colors.black),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                minimumSize: Size(150, 150),
                                side: BorderSide(width: 2, color: Colors.black),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlayNowScreen(
                                      linhvuc: 2,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Toán học',
                                textScaleFactor: 2,
                                style: TextStyle(color: Colors.black),
                              ),
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  minimumSize: Size(150, 150),
                                  side:
                                      BorderSide(width: 2, color: Colors.black),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlayNowScreen(
                                      linhvuc: 3,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Bóng đá',
                                textScaleFactor: 2,
                                style: TextStyle(color: Colors.black),
                              ),
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.greenAccent,
                                  minimumSize: Size(160, 150),
                                  side:
                                      BorderSide(width: 2, color: Colors.black),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  )),
                            )
                          ],
                        ),
                      ),
                      //
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlayNowScreen(
                                      linhvuc: 4,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Lịch sử',
                                textScaleFactor: 2,
                                style: TextStyle(color: Colors.black),
                              ),
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.amberAccent,
                                  minimumSize: Size(160, 150),
                                  side:
                                      BorderSide(width: 2, color: Colors.black),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
