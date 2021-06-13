

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './timer.dart';


class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _welcomepageState createState() => _welcomepageState();
}

// ignore: camel_case_types
class _welcomepageState extends State<WelcomePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage(
                    "images/timer.png",
                  ),
                ),
              ),
            ),
            Positioned(
              child: Timerpage(),
              top: 66,
              right: 20,
            )
          ],
        ),
      ),
    );
  }

  
}
