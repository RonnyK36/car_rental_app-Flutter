import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/detail.dart';
import 'package:car_rental_app/screens/product_list.dart';
import 'package:car_rental_app/screens/sign_up.dart';
import 'package:car_rental_app/widgets/drawer.dart';
import 'package:car_rental_app/widgets/single_product_card.dart';
import 'package:car_rental_app/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {Key? key,
      this.email,
      this.userName,
      this.name,
      this.image,
      this.price,
      this.description})
      : super(key: key);
  final String? email;
  final String? userName;
  final String? name;
  final String? image;
  final String? description;
  final double? price;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Widget _buildCategories({required String name, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        maxRadius: 25,
        backgroundImage: AssetImage('images/$name.jpg'),
        // backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
      body: Padding(
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
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (c) => ListProducts(
                                name: 'Categories',
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Show more',
                          style: kBodyTitlesTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  // color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCategories(
                          name: 'vw',
                          onTap: () {
                            print('VolksWagon selected');
                          },
                        ),
                        _buildCategories(
                          name: 'benz',
                          onTap: () {
                            print('Mercedes-Benz selected');
                          },
                        ),
                        _buildCategories(
                          name: 'nissan',
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  width: double.infinity,
                  // color: Colors.green,
                  child: Column(
                    children: [
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
                      //     ),
                      //     hintText: 'Find a car',
                      //     hintStyle: TextStyle(
                      //       fontSize: 17,
                      //     ),
                      //     prefixIcon: Icon(Icons.search_outlined),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Featured',
                                  style: kBodyTitlesTextStyle,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (c) => ListProducts(
                                          name: 'Features',
                                        ),
                                      ),
                                    );
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SingleProductCard(
                              name: 'SUVs',
                              image: 'car2.jpg',
                              price: 4499.00,
                            ),
                            SingleProductCard(
                              name: 'Saloon Cars',
                              image: 'car5.jpg',
                              price: 5999.00,
                            ),
                          ],
                        ),
                      ],
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
                      Text(
                        'See all',
                        style: kBodyTitlesTextStyle,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SingleProductCard(
                      name: 'Mercedes Benz',
                      image: 'car3.jpg',
                      price: 1499.00,
                    ),
                    SingleProductCard(
                      name: 'Race Car',
                      image: 'projects-5.jpeg',
                      price: 2499.00,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
