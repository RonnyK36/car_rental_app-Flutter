import 'package:car_rental_app/Admin/uploadItems.dart';
import 'package:car_rental_app/DialogBox/errorDialog.dart';
import 'package:car_rental_app/screens/login.dart';
import 'package:car_rental_app/widgets/customTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0a0e21), Color(0xff0a0e30)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            color: Color(0xff0a0e21),
          ),
        ),
        title: Text(
          'Rent out a car',
          style: TextStyle(
            fontFamily: "Signatra",
            fontSize: 55,
          ),
        ),
        centerTitle: true,
      ),
      body: AdminSignInScreen(),
    );
  }
}

class AdminSignInScreen extends StatefulWidget {
  @override
  _AdminSignInScreenState createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen> {
  final TextEditingController _adminIDEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //get screen size
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0a0e21), Color(0xff0a0e30)],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          color: Color(0xff0a0e21),
          // color: Colors.black54,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'images/admin.png',
                width: 250,
                height: 250,
              ),
              padding: EdgeInsets.all(10),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Admin Panel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _adminIDEditingController,
                    data: Icons.person,
                    hintText: "Enter admin ID",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _passwordEditingController,
                    data: Icons.person,
                    hintText: "Password",
                    isObsecure: true,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.purple,
                ),
              ),
              onPressed: () {
                _adminIDEditingController.text.isNotEmpty &&
                        _passwordEditingController.text.isNotEmpty
                    ? loginAdmin()
                    : showDialog(
                        context: context,
                        builder: (c) {
                          return ErrorAlertDialog(
                            message: 'Please enter ID and password',
                          );
                        });
              },
              onLongPress: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => Login()));
              },
              child: Text("Log in"),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 2.0,
              color: Colors.blueGrey,
              width: _screenWidth * 0.9,
            ),
            TextButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (c) => Login())),
              child: Row(
                children: [
                  Icon(
                    Icons.nature_people,
                    color: Colors.green,
                  ),
                  Text('Exit Admin panel'),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  loginAdmin() {
    Firestore.instance.collection('admins').getDocuments().then((snapshot) {
      snapshot.documents.forEach((result) {
        if (result.data['id'] != _adminIDEditingController.text.trim()) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Your ID is incorrect'),
          ));
        } else if (result.data['password'] !=
            _passwordEditingController.text.trim()) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Your password is incorrect'),
          ));
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Welcome ' + result.data['name']),
          ));
          setState(() {
            _adminIDEditingController.text = '';
            _passwordEditingController.text = '';
          });
          Route route = MaterialPageRoute(builder: (c) => UploadPage());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}
