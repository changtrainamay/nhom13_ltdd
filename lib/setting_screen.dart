import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

enum volume { on, off }

enum hieuung { on, off }

class _SettingScreenState extends State<SettingScreen> {
  volume? _volume;
  hieuung? _hieuung;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: ListView(
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
              SizedBox(
                height: 200,
              ),
              // khung setting
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 209, 85, 85),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Setting',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.music_note_outlined),
                          Text(
                            'Volume:',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: RadioListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text('On'),
                                value: volume.on,
                                groupValue: _volume,
                                onChanged: (val) {
                                  setState(() {
                                    _volume = val;
                                  });
                                }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text('Off'),
                                value: volume.off,
                                groupValue: _volume,
                                onChanged: (val) {
                                  setState(() {
                                    _volume = val;
                                  });
                                }),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.music_note_outlined),
                          Text(
                            'Hiệu ứng:',
                            style: TextStyle(fontSize: 20),
                          ),
                          Expanded(
                            child: RadioListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text('On'),
                                value: hieuung.on,
                                groupValue: _hieuung,
                                onChanged: (val) {
                                  setState(() {
                                    _hieuung = val;
                                  });
                                }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text('Off'),
                                value: hieuung.off,
                                groupValue: _hieuung,
                                onChanged: (val) {
                                  setState(() {
                                    _hieuung = val;
                                  });
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // đăng xuất
              Padding(
                padding: const EdgeInsets.all(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 0, 0),
                        minimumSize: Size(150, 50),
                        side: BorderSide(
                          width: 1.0,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('ĐĂNG XUẤT'),
                              content: Text('Bạn muốn có muốn đăng xuất?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Huỷ'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, 'welcome', (route) => false);
                                  },
                                  child: Text('OK'),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'Đăng xuất',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
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
