import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/splash.dart';

void main(){
  runApp(new MaterialApp(
    title: "FLUTTER学习",
    theme:new ThemeData(
      primaryIconTheme: const IconThemeData(color: Colors.white),
      brightness: Brightness.light,//高亮
      primaryColor: new Color.fromARGB(255, 0, 215, 198),
      accentColor: Colors.cyan[300],
    ),
    home: new SplashPage(),
  ));
}