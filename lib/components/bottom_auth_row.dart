import 'package:flutter/material.dart';

class BottomRow extends StatelessWidget {
  BottomRow({this.onPressed, required this.name, required this.description});
  final VoidCallback? onPressed;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(description),
        TextButton(
          onPressed: onPressed,
          child: Text(name),
        ),
      ],
    );
  }
}
