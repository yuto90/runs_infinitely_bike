import 'package:flutter/material.dart';
import 'dart:async';
import 'bike.dart';
import 'cloud.dart';
import 'desert.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  static double bikeYaxis = 1.1;
  double time = 0;
  double initialHeight = bikeYaxis;
  bool gameHasStarted = false;

  static double desertOneX = -1;
  static double desertTwoX = 3.1;
  static double desertThreeX = 7.2;

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

      setState(() {
        if (desertOneX < -5.3) {
          desertOneX += 10.6;
        } else {
          desertOneX -= 0.03;
        }
      });

      setState(() {
        if (desertTwoX < -5.3) {
          desertTwoX += 10.6;
        } else {
          desertTwoX -= 0.03;
        }
      });

      setState(() {
        if (desertThreeX < -5.3) {
          desertThreeX += 10.6;
        } else {
          desertThreeX -= 0.03;
        }
      });
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
                  Container(
                    alignment: Alignment(desertOneX, 1.1),
                    child: Desert(
                      patten: 'one',
                    ),
                  ),
                  Container(
                    alignment: Alignment(desertTwoX, 1.1),
                    child: Desert(
                      patten: 'two',
                    ),
                  ),
                  Container(
                    alignment: Alignment(desertThreeX, 1.1),
                    child: Desert(
                      patten: 'three',
                    ),
                  ),
                  Container(
                    alignment: Alignment(-0.5, bikeYaxis),
                    child: MyBike(),
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
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey,
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
