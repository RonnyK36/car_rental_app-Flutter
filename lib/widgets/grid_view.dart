import 'package:car_rental_app/screens/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGrid extends StatelessWidget {
  final Widget child;
  final String? name;
  final String? image;
  final String? description;
  final double? price;

  MyGrid(
      {required this.child,
      this.name,
      this.image,
      this.price,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        semanticChildCount: 3,
        childAspectRatio: 0.3,
        children: List.generate(2, (index) {
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (c) => DetailsPage(
              //               name: name,
              //               price: price,
              //               description: description,
              //               image: image,
              //             )));
              print('Clicked card');
            },
            child: Container(
              child: child,
            ),
          );
        }),
      ),
    );
  }
}
