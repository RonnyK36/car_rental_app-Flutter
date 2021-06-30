import 'package:car_rental_app/constants/constants.dart';
import 'package:flutter/material.dart';

class ReUsableButton extends StatelessWidget {
  ReUsableButton({this.onPressed, required this.name});
  final VoidCallback? onPressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          name,
          style: kButtonTextStyle,
        ),
      ),
    );
  }
}
