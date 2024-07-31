import 'package:flutter/material.dart';

class Ayah extends StatelessWidget {
  const Ayah({super.key, required this.text, required this.num});

  final String text;
  final int num;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text  ( $num )',
      style: TextStyle(
        height: 3,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
