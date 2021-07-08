import 'package:car_rental_app/screens/home_page.dart';
import 'package:car_rental_app/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String userName = 'Kevin';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (_, snapShot) {
          if (snapShot.hasData) {
            return HomePage();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
