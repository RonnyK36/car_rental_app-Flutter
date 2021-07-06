import 'package:car_rental_app/components/my_button.dart';
import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.white,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('images/welcome1.png'),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Car Rental',
                style: kBodyTitlesTextStyle,
              ),
            ],
          ),
          SizedBox(height: 20),
          ReUsableButton(
            name: 'Next',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (c) => HomePage()));
            },
          ),
        ],
      ),
    );
  }
}
