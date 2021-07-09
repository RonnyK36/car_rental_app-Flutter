import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/show_room.dart';
import 'package:car_rental_app/widgets/drawer.dart';
import 'package:car_rental_app/widgets/single_product_card.dart';
import 'package:car_rental_app/widgets/single_showroom_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    this.email,
    this.userName,
    this.name,
    this.image,
    this.price,
    this.type,
    this.description,
  }) : super(key: key);
  final String? email;
  final String? userName;
  final String? name;
  final String? image;
  final String? description;
  final String? type;
  final double? price;

  @override
  _HomePageState createState() => _HomePageState();
}

// Products? koege;

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Widget _buildCategories({required String name, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: AssetImage('images/$name.jpg'),
            // backgroundColor: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Icon(Icons.home),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Home Page',
                  style: kAppBarTitleTextStyle,
                ),

                // Text(
                //   'Your email: $email!',
                // ),
              ],
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              size: 20,
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('user').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.green,
                ),
              );
            }

            // koege = Products(
            //     // image: snapshot.data!.documents[0]["image"],
            //     price: snapshot.data!.documents[0]['price'],
            //     image: 'images/projects-5.jpg',
            //     name: snapshot.data!.documents[0]['name'],
            //     type: snapshot.data!.documents[0]['type']);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Categories',
                              style: kBodyTitlesTextStyle,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Show more',
                                style: kBodyTitlesTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Card(
                          elevation: 0,
                          // color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildCategories(
                                  name: 'toyota_logo',
                                  onTap: () {
                                    print('VolksWagon selected');
                                  },
                                ),
                                _buildCategories(
                                  name: 'nissan',
                                  onTap: () {
                                    print('VolksWagon selected');
                                  },
                                ),
                                _buildCategories(
                                  name: 'bmw',
                                  onTap: () {
                                    print('Mercedes-Benz selected');
                                  },
                                ),
                                _buildCategories(
                                  name: 'benz',
                                  onTap: () {
                                    print('Mercedes-Benz selected');
                                  },
                                ),
                                _buildCategories(
                                  name: 'vw',
                                  onTap: () {
                                    print('VolksWagen selected');
                                  },
                                ),
                                _buildCategories(
                                  name: 'maserati_logo',
                                  onTap: () {
                                    print('Mercedes-Benz selected');
                                  },
                                ),
                                _buildCategories(
                                  name: 'honda_logo',
                                  onTap: () {
                                    print('Nissan selected');
                                  },
                                ),
                                _buildCategories(
                                  name: 'mazda',
                                  onTap: () {
                                    print('Mazda selected');
                                  },
                                ),
                                _buildCategories(
                                  name: 'infiniti',
                                  onTap: () {
                                    print('Infiniti selected');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        width: double.infinity,
                        // color: Colors.green,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Featured',
                                        style: kBodyTitlesTextStyle,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Route route = MaterialPageRoute(
                                              builder: (c) => ShowRoom());
                                          Navigator.push(context, route);
                                        },
                                        child: Text(
                                          'See all',
                                          style: kBodyTitlesTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Card(
                              elevation: 0,
                              child: Row(
                                children: [
                                  SingleProductCard(
                                    type: 'Sedan',
                                    name: 'BMW',
                                    // type: koege!.type,
                                    image: 'car2.jpg',
                                    price: 7000,
                                  ),
                                  SingleProductCard(
                                    type: 'Luxury, VIP',
                                    name: 'Ferrari 458',
                                    image: 'ferrari_458.jpg',
                                    price: 4499.00,
                                  ),
                                  SingleProductCard(
                                    type: 'Luxury, VIP',
                                    name: 'Chevrolet',
                                    image: 'chevrolet_camaro.jpg',
                                    price: 4499.00,
                                  ),
                                  SingleProductCard(
                                    type: 'Race car',
                                    name: 'Nissan GTR',
                                    image: 'nissan_gtr_r35_skyline.jpg',
                                    price: 5999.00,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'New in Town',
                              style: kBodyTitlesTextStyle,
                            ),
                            GestureDetector(
                              onTap: () {
                                Route route = MaterialPageRoute(
                                    builder: (c) => ShowRoom());
                                Navigator.push(context, route);
                              },
                              child: Text(
                                'See all',
                                style: kBodyTitlesTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Card(
                          elevation: 0,
                          child: Column(
                            children: [
                              SingleShowRoomCard(
                                type: 'SUV',
                                name: 'Range Rover',
                                image: 'car2.jpg',
                                price: 4499.00,
                              ),
                              SingleShowRoomCard(
                                type: 'Saloon Cars',
                                name: 'Toyota',
                                image: 'car5.jpg',
                                price: 5999.00,
                              ),
                              SingleShowRoomCard(
                                type: 'German steel',
                                name: 'Mercedes Benz',
                                image: 'car3.jpg',
                                price: 1499.00,
                              ),
                              SingleShowRoomCard(
                                type: 'Race Car',
                                name: 'Nissan Skyline',
                                image: 'nissan_gtr_r35_skyline.jpg',
                                price: 2499.00,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Card(
                          elevation: 0,
                          child: Column(
                            children: [
                              SingleShowRoomCard(
                                type: 'German Steel',
                                name: 'Mercedes',
                                image: 'car3.jpg',
                                price: 4499.00,
                              ),
                              SingleShowRoomCard(
                                type: 'Race car',
                                name: 'Peugeot',
                                image: 'car5.jpg',
                                price: 5999.00,
                              ),
                              SingleShowRoomCard(
                                type: 'SUV',
                                name: 'Range rover',
                                image: 'car2.jpg',
                                price: 1499.00,
                              ),
                              SingleShowRoomCard(
                                type: 'Race Car',
                                name: 'Peugeot',
                                image: 'projects-5.jpg',
                                price: 2499.00,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
