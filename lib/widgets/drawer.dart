import 'package:car_rental_app/constants/constants.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

bool homeColor = true;
bool collectionColor = false;
bool contactUsColor = false;
bool aboutColor = false;

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('images/vw.jpg'),
            ),
            accountName: Text(
              'Kevin',
              style: kBodyTitlesTextStyle,
            ),
            accountEmail: Text(
              'ronny@gmail.com',
              style: kBodyTextStyle,
            ),
            decoration: BoxDecoration(color: Colors.green),
          ),
          ListTile(
            selected: homeColor,
            enabled: true,
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(
                  fontSize: 17, color: homeColor ? Colors.blue : Colors.black),
            ),
            onTap: () {
              setState(() {
                homeColor = true;
                collectionColor = false;
                contactUsColor = false;
                aboutColor = false;
              });
            },
          ),
          ListTile(
            selected: collectionColor,
            enabled: true,
            leading: Icon(Icons.car_repair),
            title: Text(
              'Collection',
              style: TextStyle(
                  fontSize: 17,
                  color: collectionColor ? Colors.blue : Colors.black),
            ),
            onTap: () {
              setState(() {
                collectionColor = true;
                homeColor = false;
                contactUsColor = false;
                aboutColor = false;
              });
            },
          ),
          ListTile(
            selected: contactUsColor,
            enabled: true,
            leading: Icon(Icons.phone),
            title: Text(
              'Contact us',
              style: TextStyle(
                  fontSize: 17,
                  color: contactUsColor ? Colors.blue : Colors.black),
            ),
            onTap: () {
              setState(() {
                contactUsColor = true;
                collectionColor = false;
                homeColor = false;
                aboutColor = false;
              });
            },
          ),
          ListTile(
            selected: aboutColor,
            enabled: true,
            leading: Icon(Icons.info_outline),
            title: Text(
              'About',
              style: TextStyle(
                  fontSize: 17, color: aboutColor ? Colors.blue : Colors.black),
            ),
            onTap: () {
              setState(() {
                aboutColor = true;
                collectionColor = false;
                contactUsColor = false;
                homeColor = false;
              });
            },
          ),
          ListTile(
            enabled: true,
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
