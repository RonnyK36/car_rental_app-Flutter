import 'package:car_rental_app/main.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  InputTextField({
    required this.hint,
    required this.validator,
    required this.keyBoardType,
    required this.hiddenText,
    required this.iconData,
    this.suffixIcon,
    this.hideText,
    this.checker,
  });

  final String hint;
  final TextInputType keyBoardType;
  final FormFieldValidator<String> validator;
  final bool hiddenText;
  final IconData iconData;
  final IconData? suffixIcon;
  final VoidCallback? hideText;
  final VoidCallback? checker;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType,
      validator: validator,
      onEditingComplete: checker,
      obscureText: hiddenText,
      decoration: InputDecoration(
        prefixIcon: Icon(iconData),
        suffixIcon: GestureDetector(
          child: Icon(suffixIcon),
          onTap: hideText,
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        border: OutlineInputBorder(),
      ),
    );
  }
}
