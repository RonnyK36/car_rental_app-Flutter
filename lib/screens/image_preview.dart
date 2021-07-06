import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  ImagePreview({required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/${image}'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
