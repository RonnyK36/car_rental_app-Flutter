import 'package:car_rental_app/constants/car_rental.dart';
import 'package:car_rental_app/models/item.dart';
import 'package:car_rental_app/screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/loadingWidget.dart';

class ShowRoom extends StatefulWidget {
  @override
  _ShowRoomState createState() => _ShowRoomState();
}

class _ShowRoomState extends State<ShowRoom> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xff0a0e21),
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
            'Car Ride',
            style: TextStyle(
              fontFamily: "Signatra",
              fontSize: 55,
            ),
          ),
          centerTitle: true,
          actions: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (c) => HomePage());
                    Navigator.push(context, route);
                  },
                  icon: Icon(
                    Icons.car_rental,
                    color: Colors.green,
                  ),
                ),
                Positioned(
                  child: Stack(
                    children: [
                      Icon(
                        Icons.brightness_1,
                        size: 20,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        drawer: Drawer(),
        body: CustomScrollView(
          slivers: [
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('items')
                  .limit(10)
                  .orderBy('publishDate', descending: true)
                  .snapshots(),
              builder: (context, dataSnapshot) {
                return !dataSnapshot.hasData
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: circularProgress(),
                        ),
                      )
                    : SliverStaggeredGrid.countBuilder(
                        crossAxisCount: 1,
                        staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                        itemBuilder: (context, index) {
                          UserModel model = UserModel.fromJson(
                              dataSnapshot.data!.documents[index].data);
                          return sourceInfo(model, context);
                        },
                        itemCount: dataSnapshot.data!.documents.length,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget sourceInfo(UserModel model, BuildContext context,
    {Color? background, removeCartFunction}) {
  return InkWell(
    onTap: () {
      Route route = MaterialPageRoute(builder: (c) => HomePage());
      //itemModel: model
      Navigator.push(context, route);
    },
    splashColor: Color(0xff0a0e21),
    child: Container(
      color: Color(0xff0a0e21),
      height: 190,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Image.network(
              model.thumbnailUrl!,
              filterQuality: FilterQuality.low,
              width: 130,
              height: 130,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          model.title!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          model.shortInfo!,
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    //This caused overflow, left out for future corrections
                    //Code for offers tag

                    // Container(
                    //   margin: EdgeInsets.only(left: 10),
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.rectangle,
                    //     color: Colors.green,
                    //   ),
                    //   alignment: Alignment.topLeft,
                    //   width: 40,
                    //   height: 43,
                    //   child: Center(
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Text(
                    //           '30%',
                    //           style: TextStyle(
                    //             fontSize: 15,
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.normal,
                    //           ),
                    //         ),
                    //         Text(
                    //           'off',
                    //           style: TextStyle(
                    //             fontSize: 12,
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.normal,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Row(
                            children: [
                              Text(
                                'Original price: Kshs ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                ((model.price! * 1.5).round()).toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              Text(
                                'Price per day: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Kshs ',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                (model.price).toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //will be used to remove item from cart
                Flexible(
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: ElevatedButton(
                          onPressed: () {
                            Route route =
                                MaterialPageRoute(builder: (c) => HomePage());
                            Navigator.push(context, route);
                          },
                          child: Text('Book now')),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        )),
                    Align(
                      alignment: Alignment.centerRight,
                      child: removeCartFunction == null
                          ? IconButton(
                              onPressed: () {
                                checkItemInCart(model.shortInfo!, context);
                              },
                              icon: Icon(
                                Icons.car_rental,
                                color: Colors.green,
                              ),
                            )
                          : IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  color: Colors.green,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget card({Color primaryColor = Colors.redAccent, required String imgPath}) {
  return Container();
}

void checkItemInCart(String shortInfoAsID, BuildContext context) {
  CarRentalApp.sharedPreferences!
          .getStringList(CarRentalApp.userCollectionList)
          .contains(shortInfoAsID)
      ? Fluttertoast.showToast(msg: 'Car already in your collection')
      : addItemToCart(shortInfoAsID, context);
}

addItemToCart(String shortInfoAsID, BuildContext context) {
  List tempCartList = CarRentalApp.sharedPreferences!
      .getStringList(CarRentalApp.userCollectionList);
  tempCartList.add(shortInfoAsID);

  CarRentalApp.firestore!
      .collection(CarRentalApp.collectionUser)
      .document(CarRentalApp.sharedPreferences!.getString(CarRentalApp.userUID))
      .updateData({
    CarRentalApp.userCollectionList: tempCartList,
  }).then((value) {
    Fluttertoast.showToast(msg: 'Car was added to collection');
    // CarRentalApp.sharedPreferences!
    //     .setStringList(CarRentalApp.userCollectionList!, tempCartList);
    // Provider.of<CartItemCounter>(context, listen: false).displayResult();
  });
}

removeCartFunction(String shortInfoAsID, BuildContext context) {
  List tempCartList = CarRentalApp.sharedPreferences!
      .getStringList(CarRentalApp.userCollectionList);
  tempCartList.remove(shortInfoAsID);

  CarRentalApp.firestore!
      .collection(CarRentalApp.collectionUser)
      .document(CarRentalApp.sharedPreferences!.getString(CarRentalApp.userUID))
      .updateData({
    CarRentalApp.userCollectionList: tempCartList,
  }).then((value) {
    Fluttertoast.showToast(msg: 'Car was removed from collection');
    // CarRentalApp.sharedPreferences!
    //     .setStringList(CarRentalApp.userCollectionList, tempCartList);
    // Provider.of<CartItemCounter>(context, listen: false).displayResult();
  });
}
