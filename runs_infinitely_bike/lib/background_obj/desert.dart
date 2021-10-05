import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Desert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'lib/images/desert_touka.jpg',
        fit: BoxFit.cover, // 縦横比（アスペクト比）を変えずに拡大させる
      ),
    );
  }
}
