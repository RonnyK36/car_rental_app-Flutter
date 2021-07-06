import 'package:car_rental_app/components/my_button.dart';
import 'package:car_rental_app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  final double price;
  final String image;
  final String name;
  final String type;

  CheckOut({
    required this.image,
    required this.price,
    required this.name,
    required this.type,
  });

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int count = 1;
  Widget _buildSingleCarSelection() {
    return Container(
      height: 160,
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
                Expanded(
                  flex: 6,
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    // width: 145,
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
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Quantity:',
                                  style: kColoredBodyTextStyle,
                                ),
                                Text(
                                  '1',
                                  style: kBodyTitlesTextStyle,
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

  Widget _buildBottomSheet({required String fieldName, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fieldName,
          style: kColoredBodyTextStyle,
        ),
        Text(
          price,
          style: kBodyTitlesTextStyle,
        ),
      ],
    );
  }

  Widget _buildTotalsBottomSheet(
      {required String fieldName, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fieldName,
          style: kBigColoredBodyTextStyle,
        ),
        Text(
          price,
          style: kTotalPriceTextStyle,
        ),
      ],
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
          'Check-out',
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
              SizedBox(
                height: 10,
              ),
              Text(
                'Check-out',
                style: kCarTitleTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              _buildSingleCarSelection(),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 130,
                width: double.infinity,
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                        child: _buildBottomSheet(
                            fieldName: 'Sub-total:',
                            price: widget.price.toStringAsFixed(2)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: _buildBottomSheet(
                            fieldName: 'Discounts:', price: '200.00'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: _buildBottomSheet(
                            fieldName: 'Delivery fee:', price: '600.00'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: _buildTotalsBottomSheet(
                            fieldName: 'Total cost:', price: '4899.00'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ReUsableButton(
                name: 'Pay Now',
                onPressed: () {},
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
