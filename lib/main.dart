import 'package:car_rental_app/screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/car_rental.dart';

Future<void> main() async {
  CarRentalApp.auth = FirebaseAuth.instance;
  CarRentalApp.sharedPreferences = await SharedPreferences.getInstance();
  CarRentalApp.firestore = Firestore.instance;

  runApp(MyApp());
}

//
// void main() async {
//   runApp(MyApp());
// }

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
      home: HomePage(),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.onAuthStateChanged,
      //   builder: (_, snapShot) {
      //     if (snapShot.data != null) {
      //       return HomePage();
      //     } else {
      //       return Login();
      //     }
      //   },
      // ),
    );
  }
}
