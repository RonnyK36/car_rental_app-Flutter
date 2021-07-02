import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/sign_up.dart';
import 'package:car_rental_app/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, this.email, this.userName}) : super(key: key);
  final String? email;
  final String? userName;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Widget _buildFeaturedCars(
      {required String name, required String image, required double price}) {
    return Card(
      child: Container(
        height: 160,
        width: 160,
        child: Column(
          children: [
            Container(
              height: 100,
              width: 150,
              // color: Colors.green,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/$image"),
                ),
              ),
            ),
            Text(
              price.toString(),
              style: kBodyTextStyle,
            ),
            Text(
              name,
              style: kCarTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }

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
      drawer: Drawer(),
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
              Icons.notifications_none_outlined,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.send,
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome, $userName!',
                  style: kBodyTextStyle,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  height: 150,
                  width: double.infinity,
                  // color: Colors.green,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Find a car',
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                          prefixIcon: Icon(Icons.search_outlined),
                        ),
                      ),
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
                                Text(
                                  'See all',
                                  style: kBodyTitlesTextStyle,
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
                            // ListView(
                            //   scrollDirection: Axis.horizontal,
                            //   children: [
                            //     _buildFeaturedCars(
                            //         name: 'SUVs',
                            //         image: 'car2.jpg',
                            //         price: 4000.00),
                            //     _buildFeaturedCars(
                            //         name: 'Saloon Cars',
                            //         image: 'car5.jpg',
                            //         price: 5000.00),
                            //   ],
                            // ),
                            _buildFeaturedCars(
                                name: 'SUVs',
                                image: 'car2.jpg',
                                price: 4000.00),
                            _buildFeaturedCars(
                                name: 'Saloon Cars',
                                image: 'car5.jpg',
                                price: 5000.00),
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
                        'Categories',
                        style: kBodyTitlesTextStyle,
                      ),
                      Text(
                        'See all',
                        style: kBodyTitlesTextStyle,
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
                    _buildFeaturedCars(
                        name: 'Mercedes Benz',
                        image: 'car3.jpg',
                        price: 1499.00),
                    _buildFeaturedCars(
                        name: 'Race Car',
                        image: 'projects-5.jpeg',
                        price: 2499.00),
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
