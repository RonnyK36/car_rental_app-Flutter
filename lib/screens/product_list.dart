import 'package:car_rental_app/constants/constants.dart';
import 'package:flutter/material.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({Key? key}) : super(key: key);

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
          style: kBodyTitlesTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
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
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: [
                          _buildFeaturedCars(
                            name: 'SUVs',
                            image: 'car2.jpg',
                            price: 4499.00,
                          ),
                          _buildFeaturedCars(
                              name: 'Saloon Cars',
                              image: 'car5.jpg',
                              price: 5999.00),
                        ],
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
