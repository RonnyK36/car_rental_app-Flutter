import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/detail.dart';
import 'package:flutter/material.dart';

class SingleProductCard extends StatelessWidget {
  SingleProductCard({
    required this.name,
    required this.image,
    required this.price,
    required this.type,
    // required this.width,
  });
  final String name;
  final String image;
  final double price;
  final String type;
  // final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (c) => DetailsPage(
                name: name,
                image: image,
                price: price,
                type: type,
              ),
            ),
          );
        },
        child: Container(
          height: 180,
          width: 160,
          padding: EdgeInsets.only(left: 8),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 140,
                // color: Colors.green,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/$image"),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: kCarTitleTextStyle,
                    ),
                    Text(
                      type,
                      style: kColoredBodyTextStyle,
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
            ],
          ),
        ),
      ),
    );
  }
}
