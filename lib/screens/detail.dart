import 'package:car_rental_app/components/my_button.dart';
import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final String image;
  final String type;
  final double price;

  DetailsPage(
      {required this.name,
      required this.image,
      required this.price,
      required this.type});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int count = 1;

  Widget _buildTypeCards({required String label}) {
    return GestureDetector(
      onTap: () {
        print('Card clicked');
      },
      child: Card(
        elevation: 5,
        child: Container(
          height: 60,
          width: 60,
          // color: Colors.green,
          child: Center(child: Text(label)),
        ),
      ),
    );
  }

  Widget _buildColorCards({required Color color}) {
    return GestureDetector(
      onTap: () {
        print('Color card clicked');
      },
      child: Card(
        elevation: 5,
        child: Container(
          color: color,
          height: 50,
          width: 50,
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
          'Details',
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
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 250,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/${widget.image}'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 10,
                  top: 10,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: kBodyTitlesTextStyle,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text('Kshs: '),
                                  Text(
                                    widget.price.toStringAsFixed(2),
                                    style: kPriceTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: 10,
                ),
                child: Wrap(
                  children: [
                    Text(
                      widget.type,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  'Type of drive: ',
                  style: kBodyTitlesTextStyle,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTypeCards(label: 'AWD'),
                    _buildTypeCards(label: 'FWD'),
                    _buildTypeCards(label: 'BWD'),
                    _buildTypeCards(label: '4X4'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  'Type of drive: ',
                  style: kBodyTitlesTextStyle,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildColorCards(color: Colors.black),
                    _buildColorCards(color: Colors.white),
                    _buildColorCards(color: Colors.grey),
                    _buildColorCards(color: Colors.blue),
                    _buildColorCards(color: Colors.red),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  'Rent days:',
                  style: kBodyTitlesTextStyle,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[400],
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
                          size: 30,
                        )),
                    Text(
                      count.toString(),
                      style: kBodyTitlesTextStyle,
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
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ReUsableButton(
                name: 'Book a ride',
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (c) => CartScreen(
                          image: widget.image,
                          price: widget.price,
                          name: widget.name,
                          type: widget.type)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
