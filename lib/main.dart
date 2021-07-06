import 'package:car_rental_app/screens/cart_screen.dart';
import 'package:car_rental_app/screens/check_out.dart';
import 'package:car_rental_app/screens/detail.dart';
import 'package:car_rental_app/screens/home_page.dart';
import 'package:car_rental_app/screens/login.dart';
import 'package:car_rental_app/screens/product_list.dart';
import 'package:car_rental_app/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:car_rental_app/screens/welcome.dart';

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
        // home: StreamBuilder<User?>(
        //   stream: FirebaseAuth.instance.authStateChange(),
        //   builder: (_, snapshot) {
        //     final isSignedIn = snapshot.data != null;
        //     return isSignedIn ? HomePage() : Login();
        //   },
        // ),
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
