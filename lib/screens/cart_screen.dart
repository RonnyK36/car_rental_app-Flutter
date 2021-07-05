import 'package:car_rental_app/components/my_button.dart';
import 'package:car_rental_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 132,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/car2.jpg'),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 170,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: kBodyTitlesTextStyle,
                        ),
                        Text(
                          'Type',
                          style: kBodyTextStyle,
                        ),
                        Text(
                          '4,599',
                          style: kBodyTextStyle,
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
                                count.toString(),
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
              ],
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
              _buildSingleCarSelection(),
              _buildSingleCarSelection(),
              _buildSingleCarSelection(),
              _buildSingleCarSelection(),
              SizedBox(
                height: 20,
              ),
              ReUsableButton(
                name: 'Book a ride',
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
