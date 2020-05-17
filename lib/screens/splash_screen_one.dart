import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreenOne extends StatefulWidget {
  @override
  _SplashScreenOneState createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, "/newoperation"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color(0xff622F74),
              gradient: LinearGradient(
                  colors: [new Color(0xffde5cbc), new Color(0xff03a9f4)],
                  begin: Alignment.centerRight,
                  end: new Alignment(-0.3, 0.7)
                  //end: Alignment.centerLeft,
                  ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 75.0,
                child: Image.asset(
                  'assets/url.png',
                  scale: 8.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                ),
              ),
              Text(
                'Anti Censorship Tool',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



}
