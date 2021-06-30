import 'package:car_rental_app/widgets/text_input.dart';
import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  PasswordInputField(
      {required this.hideText, this.iconData, required this.onChanged});
  final bool hideText;
  final IconData? iconData;
  final ValueChanged onChanged;
  @override
  Widget build(BuildContext context) {
    return InputTextField(
      onChanged: onChanged,
      hiddenText: hideText,
      iconData: Icons.lock,
      suffixIcon: iconData,

      // hiddenText: hideText == true ? true : false,
      keyBoardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.length < 6) {
          return "Try a stronger password";
        }
        return "";
      },
      hint: 'Password',
    );
  }
}
