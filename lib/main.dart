import 'package:car_rental_app/screens/detail.dart';
import 'package:car_rental_app/screens/home_page.dart';
import 'package:car_rental_app/screens/login.dart';
import 'package:car_rental_app/screens/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String userName = 'Kevin';
  // final String email = 'kevin@gmail';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailsPage(),
    );
  }
}
