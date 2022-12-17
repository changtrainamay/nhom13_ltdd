import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtPass2 = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.black,
                          ),
                          iconSize: 40,
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset('images/logo.png'),
                Text(
                  'ĐĂNG KÝ TÀI KHOẢN',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  height: 10,
                ),
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
                        style: TextStyle(color: Colors.black),
                        controller: txtName,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Tên',
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //username
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
                        style: TextStyle(color: Colors.black),
                        controller: txtEmail,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      obscureText: true, //ẩn password
                      style: TextStyle(color: Colors.black),
                      controller: txtPass,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Mật khẩu',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                //nhập lại pass
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      obscureText: true, //ẩn password
                      style: TextStyle(color: Colors.black),
                      controller: txtPass2,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Nhập lại mật khẩu',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //nút đăng ký
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    child: Center(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xffAFFFFA),
                          side: BorderSide(
                            width: 1.0,
                          ),
                        ),
                        onPressed: () async {
                          if (txtEmail.text.isEmpty ||
                              txtPass.text.isEmpty ||
                              txtPass2.text.isEmpty ||
                              txtName.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Vui lòng nhập đầy đủ thông tin!"),
                              ),
                            );
                          } else if (txtPass.text != txtPass2.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Vui lòng nhập trùng PassWord"),
                              ),
                            );
                          } else {
                            try {
                              final NewUser =
                                  _auth.createUserWithEmailAndPassword(
                                      email: txtEmail.text,
                                      password: txtPass.text);

                              if (NewUser != null) {
                                Map<String, dynamic> data = {
                                  "diemRank": 0,
                                  "help5050": 0,
                                  "tien": 0,
                                  "luotchoi": 5,
                                  "email": txtEmail.text,
                                  "luotthachdau": 5,
                                  "name": txtName.text,
                                  "password": txtPass.text
                                };
                                FirebaseFirestore.instance
                                    .collection("users")
                                    .add(data);
                                Navigator.pop(context, 'Đăng kí thành công');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Tài khoản này không hợp lệ"),
                                  ),
                                );
                              }
                            } catch (e) {
                              final snackBar =
                                  SnackBar(content: Text('Có lỗi xảy ra!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text(
                          'Đăng ký',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
