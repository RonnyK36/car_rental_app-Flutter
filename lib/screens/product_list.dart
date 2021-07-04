import 'package:car_rental_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:car_rental_app/widgets/grid_view.dart' as myGrid;

class ListProducts extends StatelessWidget {
  final String name;
  final String? image;
  final String? description;
  final double? price;

  ListProducts({required this.name, this.image, this.price, this.description});

  Widget _buildFeaturedCars({
    required String name,
    required String image,
    required double price,
    String? description,
  }) {
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
                      height: 800,
                      width: 350,
                      child: myGrid.MyGrid(
                        child: Column(
                          children: [
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
                            _buildFeaturedCars(
                              name: 'SUVs',
                              image: 'images/projects-5.jpeg',
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
