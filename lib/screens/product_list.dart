import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:car_rental_app/widgets/grid_view.dart' as myGrid;

class ListProducts extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final double price;

  ListProducts(
      {required this.name,
      required this.image,
      required this.price,
      required this.description});

  Widget _buildFeaturedCars({
    required String name,
    required String image,
    required double price,
    String? description,
  }) {
    return Card(
      child: Container(
        height: 200,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              // color: Colors.green,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/$image"),
                ),
              ),
            ),
            Text(
              price.toStringAsFixed(2),
              style: kBodyTextStyle,
            ),
            Text(
              name,
              style: kCarTitleTextStyle,
            ),
            Text(
              description!,
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
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text(
          'Products',
          style: kAppBarTitleTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 520,
                      width: 350,
                      child: myGrid.MyGrid(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (c) => DetailsPage(
                                      name: name,
                                      image: image,
                                      price: price,
                                      type: 'New',
                                    ),
                                  ),
                                );
                              },
                              child: _buildFeaturedCars(
                                name: 'SUVs',
                                image: 'car3.jpg',
                                price: 4499.00,
                                description: '1. This is the description.',
                              ),
                            ),
                            _buildFeaturedCars(
                              name: 'SUVs',
                              image: 'car2.jpg',
                              price: 4499.00,
                              description: '2. This is the description.',
                            ),
                            _buildFeaturedCars(
                              name: 'SUVs',
                              image: 'car5.jpg',
                              price: 4499.00,
                              description: '3. This is the description.',
                            ),
                            _buildFeaturedCars(
                              name: 'SUVs',
                              image: 'car3.jpg',
                              price: 4499.00,
                              description: 'This is the description.',
                            ),
                            _buildFeaturedCars(
                              name: 'SUVs',
                              image: 'car2.jpg',
                              price: 4499.00,
                              description: 'This is the description.',
                            ),
                            _buildFeaturedCars(
                              name: 'SUVs',
                              image: 'car5.jpg',
                              price: 4499.00,
                              description: 'This is the description.',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
