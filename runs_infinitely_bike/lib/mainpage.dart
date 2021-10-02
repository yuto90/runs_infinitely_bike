import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'bike.dart';
import 'background_obj/cloud.dart';
import 'background_obj/desert.dart';
import 'background_obj/sabotenFlower.dart';
import 'background_obj/yasi.dart';
import 'background_obj/car.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  // バイク位置
  static double bikeY = 0.4;
  // バイク初期位置
  double initialHeight = bikeY;
  // ゲーム開始フラグ
  bool gameHasStarted = false;

  // 背景
  static double desertOneX = -1;
  static double desertTwoX = 3.7;
  static double desertThreeX = 8.4;

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
  double carOneY = 0.85;
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
          bikeY = initialHeight + 0.005;
        });
      } else {
        setState(() {
          bikeY = initialHeight - 0.005;
        });
      }
      sindou = !sindou;

      setState(() {
        if (desertOneX < -6) {
          desertOneX += 12;
        } else {
          desertOneX -= 0.01;
        }
      });

      setState(() {
        if (desertTwoX < -6) {
          desertTwoX += 12;
        } else {
          desertTwoX -= 0.01;
        }
      });

      setState(() {
        if (desertThreeX < -6) {
          desertThreeX += 12;
        } else {
          desertThreeX -= 0.01;
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
          carOneX -= 0.05;
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
    final double deviceHeight = MediaQuery.of(context).size.height;
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
            Container(
              color: Colors.blue[300],
            ),
            Container(
              alignment: Alignment(desertOneX, 1),
              child: Desert(),
            ),
            Container(
              alignment: Alignment(desertTwoX, 1),
              child: Desert(),
            ),
            Container(
              alignment: Alignment(desertThreeX, 1),
              child: Desert(),
            ),
            Container(
              alignment: Alignment(sabotenFlowerOneX, sabotenFlowerY),
              child: SabotenFlower(),
            ),
            // ヤシの木 1
            Container(
              alignment: Alignment(yasiOneX, yasiOneY),
              child: Yasi(pattern: 1),
            ),
            // ヤシの木 1
            Container(
              alignment: Alignment(yasiThreeX, yasiThreeY),
              child: Yasi(pattern: 2),
            ),
            // 道路
            Positioned(
              bottom: 45,
              child: Container(
                height: 80,
                width: 1000,
                color: Colors.grey,
              ),
            ),
            Positioned(
              bottom: 90,
              child: Container(
                height: 3,
                width: 1000,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 40,
              child: Container(
                height: 7,
                width: 1000,
                color: Colors.blueGrey[100],
              ),
            ),

            // バイク
            Container(
              alignment: Alignment(-0.5, bikeY),
              child: MyBike(),
            ),
            // 対向車 1
            Container(
              alignment: Alignment(carOneX, carOneY),
              child: Car(pattern: 1),
            ),
            // ヤシの木 2
            Container(
              alignment: Alignment(yasiTwoX, yasiTwoY),
              child: Yasi(pattern: 2),
            ),
            // ヤシの木 2
            Container(
              alignment: Alignment(yasiFourX, yasiFourY),
              child: Yasi(pattern: 1),
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
