import 'package:car_rental_app/screens/sign_up.dart';
import 'package:car_rental_app/widgets/text_input.dart';
import 'package:flutter/material.dart';

class EmailTextInput extends StatelessWidget {
  const EmailTextInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputTextField(
      checker: () {},
      iconData: Icons.email,
      hiddenText: false,
      validator: (value) {
        if (value == '') {
          return 'Please add your Email';
        } else if (!regExp.hasMatch(value!)) {
          return "Email is invalid";
        }
        return "";
      },
      keyBoardType: TextInputType.emailAddress,
      hint: 'Email',
    );
  }
}
