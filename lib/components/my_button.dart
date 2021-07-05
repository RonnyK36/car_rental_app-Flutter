import 'package:car_rental_app/constants/constants.dart';
import 'package:flutter/material.dart';

class ReUsableButton extends StatelessWidget {
  ReUsableButton({this.onPressed, required this.name});
  final VoidCallback? onPressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            primary: Colors.green,
          ),
          onPressed: onPressed,
          child: Text(
            name,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
