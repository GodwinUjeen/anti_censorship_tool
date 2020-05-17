import 'package:anticensorshiptool/screens/splash_screen_one.dart';
import 'package:anticensorshiptool/screens/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var routes = <String, WidgetBuilder>{
  "/newoperation": (BuildContext context) => Tool(),
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: SplashScreenOne() ,
      routes: routes,
    );
  }
}
