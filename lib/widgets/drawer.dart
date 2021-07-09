import 'package:car_rental_app/Admin/uploadItems.dart';
import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({this.userName, this.phone});
  final String? userName;
  final String? phone;

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

bool homeColor = true;
bool collectionColor = false;
bool contactUsColor = false;
bool aboutColor = false;
bool favoriteColor = false;
bool uploadColor = false;
// void _signOut() async{
//   FirebaseAuth.instance.signOut();
//   Future<FirebaseUser> Function() user =await FirebaseAuth.instance.currentUser;
//   //print('$user');
//   runApp(
//       new MaterialApp(
//         home: new Login(),
//       )
//
//   );
Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Center(
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('images/vw.jpg'),
              ),
              accountName: Text(
                'Kevin',
                style: kWhiteBodyTitlesTextStyle,
              ),
              accountEmail: Text(
                'ronnykelvyne3@gmail.com',
                style: kBodyTextStyle,
              ),
              decoration: BoxDecoration(color: Colors.green[400]),
            ),
          ),
          ListTile(
            selected: homeColor,
            enabled: true,
            leading: Icon(
              Icons.home,
              color: Colors.green,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  fontSize: 17, color: homeColor ? Colors.green : Colors.black),
            ),
            onTap: () {
              setState(() {
                homeColor = true;
                collectionColor = false;
                contactUsColor = false;
                aboutColor = false;
                favoriteColor = false;
                uploadColor = false;
              });

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (c) => HomePage()));
            },
          ),
          ListTile(
            selected: homeColor,
            enabled: true,
            leading: Icon(
              Icons.upload_rounded,
              color: Colors.green,
            ),
            title: Text(
              'Upload',
              style: TextStyle(
                  fontSize: 17,
                  color: uploadColor ? Colors.green : Colors.black),
            ),
            onTap: () {
              setState(() {
                uploadColor = true;
                collectionColor = false;
                contactUsColor = false;
                aboutColor = false;
                favoriteColor = false;
              });

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (c) => UploadPage()));
            },
          ),
          ListTile(
            selected: favoriteColor,
            enabled: true,
            leading: Icon(
              Icons.favorite_border_outlined,
              color: Colors.green,
            ),
            title: Text(
              'Favorites',
              style: TextStyle(
                  fontSize: 17,
                  color: favoriteColor ? Colors.green : Colors.black),
            ),
            onTap: () {
              setState(() {
                favoriteColor = true;
                homeColor = false;
                collectionColor = false;
                contactUsColor = false;
                aboutColor = false;
                uploadColor = false;
              });
            },
          ),
          ListTile(
            selected: collectionColor,
            enabled: true,
            leading: Icon(Icons.car_repair, color: Colors.green),
            title: Text(
              'Collection',
              style: TextStyle(
                  fontSize: 17,
                  color: collectionColor ? Colors.green : Colors.black),
            ),
            onTap: () {
              setState(() {
                collectionColor = true;
                homeColor = false;
                contactUsColor = false;
                aboutColor = false;
                favoriteColor = false;
                uploadColor = false;
              });
            },
          ),
          ListTile(
            selected: contactUsColor,
            enabled: true,
            leading: Icon(Icons.phone, color: Colors.green),
            title: Text(
              'Contact us',
              style: TextStyle(
                  fontSize: 17,
                  color: contactUsColor ? Colors.green : Colors.black),
            ),
            onTap: () {
              setState(() {
                contactUsColor = true;
                collectionColor = false;
                homeColor = false;
                aboutColor = false;
                favoriteColor = false;
                uploadColor = false;
              });
            },
          ),
          ListTile(
            selected: aboutColor,
            enabled: true,
            leading: Icon(
              Icons.info_outline,
              color: Colors.green,
            ),
            title: Text(
              'About',
              style: TextStyle(
                  fontSize: 17,
                  color: aboutColor ? Colors.green : Colors.black),
            ),
            onTap: () {
              setState(() {
                aboutColor = true;
                collectionColor = false;
                contactUsColor = false;
                homeColor = false;
                favoriteColor = false;
                uploadColor = false;
              });
            },
          ),
          ListTile(
            enabled: true,
            leading: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 17, color: Colors.red),
            ),
            onTap: () {
              _signOut();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
