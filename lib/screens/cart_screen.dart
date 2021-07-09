import 'package:car_rental_app/components/my_button.dart';
import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/check_out.dart';
import 'package:car_rental_app/widgets/single_card_product.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final double price;
  final String image;
  final String name;
  final String type;
  final int quantity;

  CartScreen({
    required this.image,
    required this.price,
    required this.name,
    required this.type,
    required this.quantity,
  });

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        // color: Colors.green,
        height: 65,
        padding: EdgeInsets.only(bottom: 10),

        width: double.infinity,
        child: ReUsableButton(
          name: 'Proceed to check-out',
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (c) => CheckOut(
                      image: widget.image,
                      price: widget.price,
                      name: widget.name,
                      type: widget.type,
                      quantity: widget.quantity,
                    )));
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text(
          'Your selections',
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
              Icons.notifications_none_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SingleCartProduct(
                  name: widget.name,
                  image: widget.image,
                  price: widget.price,
                  type: widget.type,
                  quantity: count),

              SizedBox(
                height: 20,
              ),
              // ReUsableButton(
              //   name: 'Book a ride',
              //   onPressed: () {},
              // ),
              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
