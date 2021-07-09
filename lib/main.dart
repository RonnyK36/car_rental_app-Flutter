import 'package:car_rental_app/screens/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
