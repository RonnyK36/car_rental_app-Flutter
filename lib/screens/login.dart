import 'package:car_rental_app/components/email_text_input.dart';
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
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            validation();
                          },
                          child: Text(
                            'Login',
                            style: kButtonTextStyle,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text('I have no account.'),
                          TextButton(
                            onPressed: () {
                              Route route =
                                  MaterialPageRoute(builder: (c) => SignUp());
                              Navigator.push(context, route);
                            },
                            child: Text('Sign Up'),
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
    );
  }
}
