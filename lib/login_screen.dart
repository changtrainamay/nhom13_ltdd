import 'dart:developer';

import 'package:doan/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'forgotpassword_screen.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Services service = Services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),

                Image.asset('images/logo.png'),
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
                          labelText: 'Password',
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

                //quên mật khẩu
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //nút đăng nhập
                Padding(
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
                        onPressed: () {
                          if (txtEmail.text.isNotEmpty &&
                              txtPass.text.isNotEmpty) {
                            service.loginUser(
                                txtEmail.text, txtPass.text, context);
                          } else {
                            final snackBar = SnackBar(
                                content:
                                    Text('Tài khoản hoặc mật khẩu không đúng'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Text(
                          'Đăng nhập',
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
                SizedBox(
                  height: 10,
                ),
                //Đăng ký

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    child: Center(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xffAFFFFA),
                          minimumSize: Size(140, 50),
                          side: BorderSide(
                            width: 1.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          ).then((value) {
                            if (value != null) {
                              final snackBar = SnackBar(content: Text(value));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          });
                        },
                        child: Text(
                          'Đăng ký',
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
          ),
        ),
      ),
    );
  }
}
