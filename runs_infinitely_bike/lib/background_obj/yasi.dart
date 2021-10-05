import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      width: 200.w,
      height: 200.h,
      child: Image.asset(yasiPattern),
    );
  }
}
