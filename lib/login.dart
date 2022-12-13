import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'forgotpassword_screen.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class Services {
  final auth = FirebaseAuth.instance;
  loginUser(email, password, context) async {
    late String txtEmail;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      auth.authStateChanges().listen((event) {
        if (event != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      });
    } catch (e) {
      final snackBar = SnackBar(content: Text('Lỗi kết nối đến Server'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
