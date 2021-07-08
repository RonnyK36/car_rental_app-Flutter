import 'package:car_rental_app/constants/constants.dart';
import 'package:flutter/material.dart';

class SingleProductCard extends StatelessWidget {
  SingleProductCard({
    required this.name,
    required this.image,
    required this.price,
    // required this.type,
  });
  final String name;
  final String image;
  final double price;
  // final String type;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 160,
        width: 160,
        padding: EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              name,
              style: kCarTitleTextStyle,
            ),
            Row(
              children: [
                Text(
                  'Kshs. ',
                  style: kColoredBodyTextStyle,
                ),
                Text(
                  price.toStringAsFixed(2),
                  style: kBodyTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
