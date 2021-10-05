import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cloud extends StatelessWidget {
  final heightSize;
  final widthSize;
  Cloud({this.heightSize, this.widthSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthSize.w,
      height: heightSize.h,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 10.w, color: Colors.blue[200]!),
          borderRadius: BorderRadius.circular(60)),
    );
  }
}
