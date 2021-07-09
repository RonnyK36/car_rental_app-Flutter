import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/image_preview.dart';
import 'package:flutter/material.dart';

class SingleCartProduct extends StatefulWidget {
  final String name;
  final double price;
  final int quantity;
  final String image;
  final String type;
  SingleCartProduct({
    required this.name,
    required this.image,
    required this.price,
    required this.type,
    required this.quantity,
  });

  @override
  _SingleCartProductState createState() => _SingleCartProductState();
}

int count = 1;

class _SingleCartProductState extends State<SingleCartProduct> {
  @override
  Widget build(BuildContext context) {
    count = widget.quantity;

    return Container(
      height: 170,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => ImagePreview(image: widget.image)));
                      },
                      child: Container(
                        height: 132,
                        width: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/${widget.image}'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    height: 150,
                    width: 170,
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: kSmallBodyTextStyle,
                          ),
                          Text(
                            widget.type,
                            style: kBodyTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          SizedBox(height: 10),
                          Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green[200],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (count > 1) {
                                          count--;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 20,
                                    )),
                                Text(
                                  widget.quantity.toString(),
                                  style: kCarTitleTextStyle,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (count < 5) {
                                        count++;
                                      }
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
