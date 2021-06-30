import 'package:car_rental_app/components/bottom_auth_row.dart';
import 'package:car_rental_app/components/email_text_input.dart';
import 'package:car_rental_app/components/my_button.dart';
import 'package:car_rental_app/components/password_text_input.dart';
import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/sign_up.dart';
import 'package:car_rental_app/widgets/text_input.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = RegExp(p);
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String? email;
String? password;

class _LoginState extends State<Login> {
  bool hideText = true;
  void validation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("Success");
    } else {
      print('Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: kTitleTextStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EmailTextInput(
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                          print(email);
                        },
                      ),
                      //Password text input field
                      PasswordInputField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                          print(password);
                        },
                        hideText: true,
                        iconData: hideText == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      // button to login
                      ReUsableButton(
                        onPressed: () {
                          validation();
                        },
                        name: 'Login',
                      ),
                      // Row to toggle btwn login and signup
                      BottomRow(
                        name: 'SignUp',
                        description: 'I don\'t have an account.',
                        onPressed: () {
                          Route route =
                              MaterialPageRoute(builder: (c) => SignUp());
                          Navigator.push(context, route);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
