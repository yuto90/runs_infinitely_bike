import 'package:flutter/material.dart';

class Yasi extends StatelessWidget {
  final pattern;
  Yasi({this.pattern});

  String yasiPattern = '';

  @override
  Widget build(BuildContext context) {
    if (pattern == 1) {
      yasiPattern = 'lib/images/yasi.jpg';
    } else {
      yasiPattern = 'lib/images/yasi2.jpg';
    }

    return Container(
      width: 200,
      height: 200,
      child: Image.asset(yasiPattern),
    );
  }
}
