import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'bike.dart';
import 'background_obj/cloud.dart';
import 'background_obj/desert.dart';
import 'background_obj/sabotenFlower.dart';
import 'background_obj/yasi.dart';
import 'background_obj/car.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  // バイク位置
  static double bikeY = 4.7;
  // バイク初期位置
  double initialHeight = bikeY.h;
  // ゲーム開始フラグ
  bool gameHasStarted = false;

  // 背景
  static double whiteLineOneX = 0;
  static double whiteLineTwoX = 3.7;
  static double whiteLineThreeX = 8.4;
  static double whiteLineFourX = 8.4;

  // サボテンフラワー
  double sabotenFlowerY = 1;
  static double sabotenFlowerOneX = 1;

  // ヤシの木
  double yasiOneY = -0.3;
  double yasiTwoY = 1;
  double yasiThreeY = -0.3;
  double yasiFourY = 1;
  static double yasiOneX = 1;
  static double yasiTwoX = 1.5;
  static double yasiThreeX = 1.5;
  static double yasiFourX = 2;

  // 対向車
  double carOneY = 0.5;
  static double carOneX = 2;

  bool sindou = true;

  // ODOメーター
  int odo = 0;
  int milli = 0;

  void move() {
    setState(() {
      //time = 0;
      //initialHeight = bikeY;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (sindou) {
        setState(() {
          bikeY = initialHeight + 5.h;
        });
      } else {
        setState(() {
          bikeY = initialHeight - 5.h;
        });
      }
      sindou = !sindou;

      setState(() {
        if (whiteLineOneX < -200) {
          whiteLineOneX += 1200;
        } else {
          whiteLineOneX -= 1;
        }
      });

      setState(() {
        if (whiteLineTwoX < -6) {
          whiteLineTwoX += 12;
        } else {
          whiteLineTwoX -= 0.01;
        }
      });

      setState(() {
        if (whiteLineThreeX < -6) {
          whiteLineThreeX += 12;
        } else {
          whiteLineThreeX -= 0.01;
        }
      });

      setState(() {
        if (whiteLineFourX < -6) {
          whiteLineFourX += 12;
        } else {
          whiteLineFourX -= 0.01;
        }
      });

      setState(() {
        if (sabotenFlowerOneX < -2) {
          sabotenFlowerOneX += 4;
        } else {
          sabotenFlowerOneX -= 0.005;
        }
      });

      setState(() {
        if (yasiOneX < -2) {
          yasiOneX += 4;
        } else {
          yasiOneX -= 0.005;
        }
      });

      setState(() {
        if (yasiTwoX < -2) {
          yasiTwoX += 4;
        } else {
          yasiTwoX -= 0.005;
        }
      });

      setState(() {
        if (yasiThreeX < -2) {
          yasiThreeX += 4;
        } else {
          yasiThreeX -= 0.005;
        }
      });

      setState(() {
        if (yasiFourX < -2) {
          yasiFourX += 4;
        } else {
          yasiFourX -= 0.005;
        }
      });

      setState(() {
        if (carOneX < -2) {
          carOneX += 10;
        } else {
          carOneX -= 0.02;
        }
      });

      // odoメーター（5秒+=1km)
      setState(() {
        milli += 50;
        if (milli % 5000 == 0) {
          odo += 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // デバイス毎の画面サイズを取得
    //final double deviceHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          move();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            //! 背景
            Container(
              color: Colors.red,
              height: double.infinity.h,
              width: double.infinity.w,
              child: Desert(),
            ),
            // 道路
            Positioned(
              bottom: 290.h,
              child: Container(
                height: 600.h,
                width: 1500.w,
                color: Colors.grey,
              ),
            ),

            Positioned(
              bottom: 650.h,
              left: whiteLineOneX,
              child: Container(
                height: 30.h,
                width: 150.w,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 650.h,
              left: 200,
              child: Container(
                height: 30.h,
                width: 150.w,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 650.h,
              left: 400,
              child: Container(
                height: 30.h,
                width: 150.w,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 650.h,
              left: 600,
              child: Container(
                height: 30.h,
                width: 150.w,
                color: Colors.white,
              ),
            ),

            Positioned(
              bottom: 40,
              child: Container(
                height: 50.h,
                width: 1500.w,
                color: Colors.blueGrey[100],
              ),
            ),
            Positioned(
              bottom: 136,
              child: Container(
                height: 30.h,
                width: 1500.w,
                color: Colors.blueGrey[100],
              ),
            ),

            // バイク
            Positioned(
              bottom: 350.h + bikeY,
              right: 600.w,
              child: Container(
                //alignment: Alignment(0.5, bikeY),
                height: 500.h,
                width: 500.w,
                child: MyBike(),
              ),
            ),
            Container(
              alignment: Alignment(0, 0.2),
              child: gameHasStarted
                  ? Text('')
                  : Text(
                      'Infinit Bike \nT A P  T O  P L A Y',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
            ),
            Positioned(
              top: 10,
              left: 20,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ODO: $odo km',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
