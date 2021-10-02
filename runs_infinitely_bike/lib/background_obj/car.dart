import 'package:flutter/material.dart';

class Car extends StatelessWidget {
  final pattern;
  Car({this.pattern});

  String carPattern = '';

  @override
  Widget build(BuildContext context) {
    if (pattern == 1) {
      carPattern = 'lib/images/car_1.jpg';
    } else {
      carPattern = 'lib/images/car_1.jpg';
    }

    return Container(
      height: 120,
      width: 120,
      child: Image.asset(carPattern),
    );
  }
}
