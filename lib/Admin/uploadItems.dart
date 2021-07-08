import 'dart:io';

import 'package:car_rental_app/Admin/adminShiftOrders.dart';
import 'package:car_rental_app/screens/home_page.dart';
import 'package:car_rental_app/screens/login.dart';
import 'package:car_rental_app/widgets/loadingWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'adminShiftOrders.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage>
    with AutomaticKeepAliveClientMixin<UploadPage> {
  bool get wantKeepAlive => true;
  File? file;
  TextEditingController _descriptionTextEditingController =
      TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();
  TextEditingController _topSpeedTextEditingController =
      TextEditingController();
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _typeTextEditingController = TextEditingController();
  String productId = DateTime.now().microsecondsSinceEpoch.toString();
  bool uploading = false;

  @override
  Widget build(BuildContext context) {
    return file == null ? displayAdminHomeScreen() : displayAdminUploadScreen();
  }

  displayAdminHomeScreen() {
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
        leading: IconButton(
          icon: Icon(
            Icons.border_color,
            color: Colors.white,
          ),
          onPressed: () {
            Route route = MaterialPageRoute(builder: (c) => AdminShiftOrders());
            Navigator.pushReplacement(context, route);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Route route = MaterialPageRoute(
                builder: (c) => Login(),
              );
              Navigator.pushReplacement(context, route);
            },
            child: Text(
              'Log out',
              style: TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: getAdminScreen(),
    );
  }

  getAdminScreen() {
    return Container(
      color: Color(0xff0a0e21),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shop_two,
              color: Colors.white,
              size: 200,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                child: Text(
                  'Add new items',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  //  get new image
                  getImage(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getImage(mContext) {
    return showDialog(
        context: mContext,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              'Item image',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              SimpleDialogOption(
                child: Text(
                  'Take a picture',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                onPressed: () {
                  capturePhoto();
                },
              ),
              SimpleDialogOption(
                child: Text(
                  'Select from gallery',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                onPressed: () {
                  getFromGallery();
                },
              ),
              SimpleDialogOption(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  capturePhoto() async {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 680,
      maxWidth: 970,
    );
    setState(() {
      file = imageFile;
    });
  }

  getFromGallery() async {
    File imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      file = imageFile;
    });
  }

  displayAdminUploadScreen() {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          color: Colors.green,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            clearForm();
            Route route = MaterialPageRoute(builder: (c) => HomePage());
            Navigator.pushReplacement(context, route);
          },
        ),
        title: Text(
          'New product',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: uploading ? null : () => uploadItem(),
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          uploading ? linearProgress() : Text(''),
          Container(
            height: 230,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(file!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.green,
            ),
            title: Container(
              width: 250,
              child: TextField(
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                ),
                controller: _typeTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Type',
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Color(0xff0a0e21),
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.green,
            ),
            title: Container(
              width: 250,
              child: TextField(
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                ),
                controller: _nameTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Color(0xff0a0e21),
          ),
          ListTile(
            leading: Icon(
              Icons.speed,
              color: Colors.green,
            ),
            title: Container(
              width: 250,
              child: TextField(
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                ),
                controller: _topSpeedTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Top speed',
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Color(0xff0a0e21),
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.green,
            ),
            title: Container(
              width: 250,
              child: TextField(
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                ),
                controller: _descriptionTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Description',
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Color(0xff0a0e21),
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.green,
            ),
            title: Container(
              width: 250,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                ),
                controller: _priceTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Price',
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Color(0xff0a0e21),
          ),
        ],
      ),
    );
  }

  clearForm() {
    setState(() {
      // file = null;
      _descriptionTextEditingController.clear();
      _nameTextEditingController.clear();
      _priceTextEditingController.clear();
      _typeTextEditingController.clear();
    });
  }

  uploadItem() async {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadImage(file);
    saveItemInfo(imageDownloadUrl);
  }

  Future<String> uploadImage(mFileImage) async {
    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child('Items');
    StorageUploadTask uploadTask =
        storageReference.child('product_$productId.jpg').putFile(mFileImage);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  saveItemInfo(String downloadUrl) {
    final itemsRef = Firestore.instance.collection('items');
    itemsRef.document(productId).setData({
      'type': _typeTextEditingController.text.trim(),
      'description': _descriptionTextEditingController.text.trim(),
      'price': (_priceTextEditingController.text).toString(),
      'publishDate': DateTime.now(),
      'status': 'available',
      'thumbnailUrl': downloadUrl,
      'name': _nameTextEditingController.text.trim(),
      'topSpeed': _topSpeedTextEditingController.text.trim(),
    });
    setState(() {
      // file = null;
      uploading = false;
      productId = DateTime.now().microsecondsSinceEpoch.toString();
      _descriptionTextEditingController.clear();
      _nameTextEditingController.clear();
      _typeTextEditingController.clear();
      _priceTextEditingController.clear();
      _topSpeedTextEditingController.clear();
    });
  }
}
