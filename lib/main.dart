import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
};

void main() => runApp(
      new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: routes,
      ),
    );
