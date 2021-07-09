import 'package:car_rental_app/widgets/single_showroom_card.dart';
import 'package:flutter/material.dart';

class ShowRoom extends StatelessWidget {
  const ShowRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Find a car',
                    hintStyle: TextStyle(
                      fontSize: 17,
                    ),
                    prefixIcon: Icon(Icons.search_outlined),
                  ),
                ),
                SingleShowRoomCard(
                    type: 'German machine',
                    name: 'Mercedes',
                    image: 'car3.jpg',
                    price: 3500),
                SingleShowRoomCard(
                    type: 'Sedan',
                    name: 'BMW M3',
                    image: 'bmw_m3_race_car.jpg',
                    price: 2500),
                SingleShowRoomCard(
                    type: 'Luxury',
                    name: 'Pagani Zonda',
                    image: '2009_pagani_zonda.jpg',
                    price: 5000),
                SingleShowRoomCard(
                    type: 'Luxury,VIP',
                    name: 'Chevrolet Camaro',
                    image: 'camaro_concept.jpg',
                    price: 3500),
                SingleShowRoomCard(
                    type: 'Luxury',
                    name: 'Ferrari 458',
                    image: 'ferrari_458.jpg',
                    price: 13500),
                SingleShowRoomCard(
                    type: 'Italian class',
                    name: 'Ferrari California',
                    image: 'ferrari_california.jpg',
                    price: 11500),
                SingleShowRoomCard(
                    type: 'VIP',
                    name: 'Koenigsegg',
                    image: 'koenigsegg.jpg',
                    price: 7500),
                SingleShowRoomCard(
                    type: 'VIP',
                    name: 'Koenigsegg ccx',
                    image: 'koenigsegg_orange.jpg',
                    price: 6500),
                SingleShowRoomCard(
                    type: 'Concept',
                    name: 'K ccx Black',
                    image: 'koenigsegg_ccx-black.jpg',
                    price: 8000),
                SingleShowRoomCard(
                    type: 'Race car',
                    name: 'K ccx yellow',
                    image: 'koenigsegg_ccx_yellow.jpg',
                    price: 7000),
                SingleShowRoomCard(
                    type: 'Race car',
                    name: 'Nissan GTR',
                    image: 'nissan_gtr_r35_skyline.jpg',
                    price: 5500),
                SingleShowRoomCard(
                    type: 'Race car',
                    name: 'Ford Mustang',
                    image: 'sms_ford_mustang.jpg',
                    price: 4000),
                SingleShowRoomCard(
                    type: 'Luxury',
                    name: 'Volvo c30',
                    image: 'volvo_c30.jpg',
                    price: 3900),
                SingleShowRoomCard(
                    type: 'Sleek',
                    name: 'Mercedes',
                    image: 'car3.jpg',
                    price: 3500),
                SingleShowRoomCard(
                  type: 'Class',
                  name: 'Alfa Romeo',
                  image: 'car2.jpg',
                  price: 3500,
                ),
                SingleShowRoomCard(
                    type: 'Comfort',
                    name: 'Range Rover',
                    image: 'projects-5.jpg',
                    price: 7500),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
