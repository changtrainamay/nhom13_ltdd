import 'package:doan/history_screen.dart';
import 'package:doan/home_screen.dart';
import 'package:doan/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//aaa
//void main() {
//  runApp(const DoanApp());}
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DoanApp());
}

class DoanApp extends StatelessWidget {
  //const DoanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? 'home' : 'welcome',
      routes: {
        'welcome': (context) => LoginScreen(),
        'home': (context) => HomeScreen(),
      },
    );
  }
}
