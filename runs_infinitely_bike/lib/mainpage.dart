import 'package:flutter/material.dart';
import 'dart:async';
import 'bike.dart';

import 'cloud.dart';
import 'building.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  static double bikeYaxis = 1.1;
  double time = 0;
  double initialHeight = bikeYaxis;
  bool gameHasStarted = false;

  // 背景
  double back = 1;

  bool sindou = true;

  void move() {
    setState(() {
      //time = 0;
      //initialHeight = bikeYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      if (sindou) {
        setState(() {
          bikeYaxis = initialHeight + 0.005;
        });
      } else {
        setState(() {
          bikeYaxis = initialHeight - 0.005;
        });
      }
      sindou = !sindou;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          move();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  AnimatedContainer(
                    // バイクの初期位置
                    alignment: Alignment(-0.5, bikeYaxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: MyBike(),
                  ),
                  Container(
                    alignment: Alignment(0, -0.2),
                    child: gameHasStarted
                        ? Text('')
                        : Text(
                            'Infinit Bike \nT A P  T O  P L A Y',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'TIME',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
