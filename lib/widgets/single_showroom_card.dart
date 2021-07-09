import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/detail.dart';
import 'package:flutter/material.dart';

class SingleShowRoomCard extends StatefulWidget {
  SingleShowRoomCard({
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

  @override
  _SingleShowRoomCardState createState() => _SingleShowRoomCardState();
}

IconData _favorite = Icons.favorite_border_outlined;
bool fav = false;

class _SingleShowRoomCardState extends State<SingleShowRoomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (c) => DetailsPage(
                name: widget.name,
                image: widget.image,
                price: widget.price,
                type: widget.type,
              ),
            ),
          );
        },
        child: Container(
          height: 160,
          width: double.infinity,
          padding: EdgeInsets.only(left: 8),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 160,
                // color: Colors.green,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/${widget.image}"),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 150,
                width: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: kCarTitleTextStyle,
                    ),
                    Text(
                      widget.type,
                      style: kColoredBodyTextStyle,
                    ),
                    Row(
                      children: [
                        Text(
                          'Kshs. ',
                          style: kColoredBodyTextStyle,
                        ),
                        Text(
                          widget.price.toStringAsFixed(2),
                          style: kBodyTextStyle,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              fav = true;
                              setState(() {
                                if (fav = true) {
                                  _favorite = Icons.favorite;
                                } else {
                                  _favorite = Icons.favorite_border_outlined;
                                }
                              });
                            },
                            icon: Icon(
                              _favorite,
                              color: Colors.red,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Book'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Row(
          //   children: [
          //     Container(
          //       height: 150,
          //       width: 200,
          //       child: Card(
          //         color: Colors.green,
          //       ),
          //     ),
          //     Container(
          //       height: 150,
          //       width: 140,
          //       child: Card(
          //         color: Colors.blue,
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
