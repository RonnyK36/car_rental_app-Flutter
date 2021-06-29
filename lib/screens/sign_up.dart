import 'package:car_rental_app/components/email_text_input.dart';
import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);

class _SignUpState extends State<SignUp> {
  void validation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("Success");
    } else {
      print('Failed');
    }
  }

  bool hideText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Register',
                          style: kTitleTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 500,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InputTextField(
                          iconData: Icons.person,
                          hiddenText: false,
                          validator: (value) {
                            if (value!.length < 4) {
                              return "Username is too short";
                            } else if (value == '') {
                              return "Please add your name";
                            }
                            return '';
                          },
                          keyBoardType: TextInputType.name,
                          hint: 'Username',
                        ),
                        EmailTextInput(),
                        InputTextField(
                          hideText: () {
                            setState(() {
                              hideText = !hideText;
                            });
                          },
                          iconData: Icons.lock,
                          suffixIcon: hideText == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          hiddenText: hideText == true ? true : false,
                          keyBoardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.length < 6) {
                              return "Try a stronger password";
                            }
                            return "";
                          },
                          hint: 'Password',
                        ),
                        InputTextField(
                          iconData: Icons.phone,
                          hiddenText: false,
                          validator: (value) {
                            if (value!.length < 11) {
                              return "Invalid phone number";
                            } else if (value == '') {
                              return 'Phone number cannot be blank';
                            }
                            return '';
                          },
                          keyBoardType: TextInputType.phone,
                          hint: 'Phone number',
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              validation();
                            },
                            child: Text(
                              'Sign Up',
                              style: kButtonTextStyle,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text('Already have an account?'),
                            TextButton(
                              onPressed: () {
                                Route route =
                                    MaterialPageRoute(builder: (c) => Login());
                                Navigator.push(context, route);
                              },
                              child: Text('Login'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
