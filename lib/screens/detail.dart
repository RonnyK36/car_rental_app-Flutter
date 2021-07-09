import 'package:car_rental_app/components/my_button.dart';
import 'package:car_rental_app/constants/constants.dart';
import 'package:car_rental_app/screens/check_out.dart';
import 'package:car_rental_app/screens/image_preview.dart';
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

  get image => widget.image;

  Widget _buildTypeCards(
      {required String label,
      required Color color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: color,
        child: Container(
          height: 60,
          width: 60,
          // color: Colors.green,
          child: Center(child: Text(label)),
        ),
      ),
    );
  }

  Widget _buildColorCards(
      {required Color color,
      required Color selectedColor,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: selectedColor,
        height: 55,
        child: Card(
          elevation: 5,
          child: Container(
            color: color,
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }

  bool awdColor = true;
  bool fwdColor = false;
  bool bwdColor = false;
  bool fourColor = false;
  bool blackColor = true;
  bool whiteColor = false;
  bool greyColor = false;
  bool blueColor = false;
  bool redColor = false;

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
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => ImagePreview(image: widget.image)));
                  },
                  child: Container(
                    height: 250,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              //changed from widget.image
                              image: AssetImage('images/$image'),
                            ),
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
                    _buildTypeCards(
                      label: 'AWD',
                      color: awdColor ? Colors.green : Colors.white,
                      onTap: () {
                        setState(() {
                          awdColor = true;
                          fwdColor = false;
                          bwdColor = false;
                          fourColor = false;
                        });
                      },
                    ),
                    _buildTypeCards(
                      label: 'FWD',
                      color: fwdColor ? Colors.green : Colors.white,
                      onTap: () {
                        setState(() {
                          awdColor = false;
                          fwdColor = true;
                          bwdColor = false;
                          fourColor = false;
                        });
                      },
                    ),
                    _buildTypeCards(
                      label: 'BWD',
                      color: bwdColor ? Colors.green : Colors.white,
                      onTap: () {
                        setState(() {
                          awdColor = false;
                          fwdColor = false;
                          bwdColor = true;
                          fourColor = false;
                        });
                      },
                    ),
                    _buildTypeCards(
                      label: '4X4',
                      color: fourColor ? Colors.green : Colors.white,
                      onTap: () {
                        setState(() {
                          awdColor = false;
                          fwdColor = false;
                          bwdColor = false;
                          fourColor = true;
                        });
                      },
                    ),
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
                    _buildColorCards(
                      color: Colors.black,
                      selectedColor:
                          blackColor ? Colors.green : Color(0xfff5f5f5),
                      onTap: () {
                        setState(() {
                          blackColor = true;
                          whiteColor = false;
                          greyColor = false;
                          blueColor = false;
                          redColor = false;
                        });
                      },
                    ),
                    _buildColorCards(
                      color: Colors.white,
                      selectedColor:
                          whiteColor ? Colors.green : Color(0xfff5f5f5),
                      onTap: () {
                        setState(() {
                          blackColor = false;
                          whiteColor = true;
                          greyColor = false;
                          blueColor = false;
                          redColor = false;
                        });
                      },
                    ),
                    _buildColorCards(
                      color: Colors.grey,
                      selectedColor:
                          greyColor ? Colors.green : Color(0xfff5f5f5),
                      onTap: () {
                        setState(() {
                          blackColor = false;
                          whiteColor = false;
                          greyColor = true;
                          blueColor = false;
                          redColor = false;
                        });
                      },
                    ),
                    _buildColorCards(
                      color: Colors.blue,
                      selectedColor:
                          blueColor ? Colors.green : Color(0xfff5f5f5),
                      onTap: () {
                        setState(() {
                          blackColor = false;
                          whiteColor = false;
                          greyColor = false;
                          blueColor = true;
                          redColor = false;
                        });
                      },
                    ),
                    _buildColorCards(
                      color: Colors.red,
                      selectedColor:
                          redColor ? Colors.green : Color(0xfff5f5f5),
                      onTap: () {
                        setState(() {
                          blackColor = false;
                          whiteColor = false;
                          greyColor = false;
                          blueColor = false;
                          redColor = true;
                        });
                      },
                    ),
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
                      builder: (c) => CheckOut(
                            image: widget.image,
                            price: widget.price,
                            name: widget.name,
                            type: widget.type,
                            quantity: count,
                          )));
                },
                // onPressed: () {
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (c) => CartScreen(
                //           image: widget.image,
                //           price: widget.price,
                //           name: widget.name,
                //           type: widget.type,
                //           quantity: count,
                //         )));
                // },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
