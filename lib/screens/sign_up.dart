import 'package:car_rental_app/components/bottom_auth_row.dart';
import 'package:car_rental_app/components/email_text_input.dart';
import 'package:car_rental_app/components/my_button.dart';
import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/home_page.dart';
import 'package:car_rental_app/widgets/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);
String? email;
String? password;
String? username;
String? phone;

class _SignUpState extends State<SignUp> {
  void validation() async {
    final FormState? _form = _formKey.currentState;
    if (!_form!.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
        print(result.user!.email);
        print(result.user!.phoneNumber);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => HomePage(
                      email: result.user!.email,
                    )));
      } on PlatformException catch (e) {
        print(e.message.toString());
        ScaffoldMessenger.of(context)
            // _scaffoldKey.currentState!
            .showSnackBar(SnackBar(content: Text(e.message!)));
      }
    }
  }

  Widget _buildTextFormFields() {
    return Container(
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InputTextField(
            onChanged: (value) {
              setState(() {
                username = value;
              });
              print(username);
              // validation();
            },
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
          EmailTextInput(
            onChanged: (value) {
              setState(() {
                email = value;
              });
              print(email);
              // validation();
            },
          ),
          InputTextField(
            onChanged: (value) {
              setState(() {
                password = value;
              });
              // print(password);
            },
            hideText: () {
              setState(() {
                hideText = !hideText;
              });
            },
            iconData: Icons.lock,
            suffixIcon:
                hideText == true ? Icons.visibility : Icons.visibility_off,
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
            onChanged: (value) {
              setState(() {
                phone = value;
              });
              print(phone);
            },
            iconData: Icons.phone,
            hiddenText: false,
            validator: (value) {
              if (value!.length < 10) {
                return "Invalid phone number";
              } else if (value == '') {
                return 'Phone number cannot be blank';
              }
              return '';
            },
            keyBoardType: TextInputType.phone,
            hint: 'Phone number',
          ),
        ],
      ),
    );
  }

  bool hideText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                        _buildTextFormFields(),
                        ReUsableButton(
                          name: 'SignUp',
                          onPressed: () {
                            validation();
                          },
                        ),
                        BottomRow(
                          name: 'Login',
                          description: 'Already have an account?',
                          onPressed: () {
                            Navigator.pop(context);
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
      ),
    );
  }
}
