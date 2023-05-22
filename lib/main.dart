import 'package:doan/gg_maps/google_maps.dart';

import 'package:doan/screen/home1_screen.dart';
import 'package:doan/screen/login_screen.dart';
import 'package:doan/screen/welcome_screen.dart';
import 'package:doan/tracking_location/maps.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'aaaa',
//       home: MapSample(),
//     );
//   }
// }

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
          FirebaseAuth.instance.currentUser == null ? 'welcome' : 'home',
      routes: {
        'welcome': (context) => loginScreen(),
        'home': (context) => home1Screen(),
      },
    );
  }
}
