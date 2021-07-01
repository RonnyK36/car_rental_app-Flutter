import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/sign_up.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.email}) : super(key: key);
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[150],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Icon(Icons.home),
            SizedBox(
              width: 20,
            ),
            Text('Home Page'),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.green[400],
              elevation: 5,
              borderOnForeground: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' Welcome, your email is $email!',
                  style: kBodyTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
