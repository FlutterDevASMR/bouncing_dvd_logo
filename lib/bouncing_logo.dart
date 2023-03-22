import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class BouncingLogo extends StatefulWidget {
  const BouncingLogo({super.key});

  @override
  State<BouncingLogo> createState() => _BouncingLogoState();
}

enum directionY { UP, DOWN }

enum directionX { LEFT, RIGHT }

class _BouncingLogoState extends State<BouncingLogo> {
  Color logoColor = Colors.red;
  double logoX = 0;
  double logoY = -1;

  var logoDirectionY = directionY.DOWN;
  var logoDirectionX = directionX.RIGHT;

  void updateDirectionY() {
    if (logoY >= 1) {
      logoDirectionY = directionY.UP;
      logoColor =
          Color((Random().nextDouble() * 0xffffff).toInt()).withOpacity(1);
    } else if (logoY <= -1) {
      logoDirectionY = directionY.DOWN;
      logoColor =
          Color((Random().nextDouble() * 0xffffff).toInt()).withOpacity(1);
    }
  }

  void updateDirectionX() {
    if (logoX >= 1) {
      logoDirectionX = directionX.LEFT;
      logoColor =
          Color((Random().nextDouble() * 0xffffff).toInt()).withOpacity(1);
    } else if (logoX <= -1) {
      logoDirectionX = directionX.RIGHT;
      logoColor =
          Color((Random().nextDouble() * 0xffffff).toInt()).withOpacity(1);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        updateDirectionY();
        updateDirectionX();

        if (logoDirectionY == directionY.DOWN) {
          logoY += 0.01;
        } else if (logoDirectionY == directionY.UP) {
          logoY -= 0.01;
        }

        if (logoDirectionX == directionX.LEFT) {
          logoX -= 0.01;
        } else if (logoDirectionX == directionX.RIGHT) {
          logoX += 0.01;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(logoX, logoY),
      child: Container(
        width: 100,
        height: 100,
        child: Image.asset(
          'images/dvd_logo.png',
          color: logoColor,
        ),
      ),
    );
  }
}
