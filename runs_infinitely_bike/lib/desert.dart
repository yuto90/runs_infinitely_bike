import 'package:flutter/material.dart';

class Desert extends StatelessWidget {
  final patten;
  Desert({this.patten});
  String desertPatten = '';

  @override
  Widget build(BuildContext context) {
    if (patten == 'one') {
      desertPatten = 'lib/images/sabaku_one.jpg';
    } else if (patten == 'two') {
      desertPatten = 'lib/images/sabaku_two.jpg';
    } else {
      desertPatten = 'lib/images/sabaku_one.jpg';
    }
    return Container(
      child: Image.asset(desertPatten),
    );
  }
}
