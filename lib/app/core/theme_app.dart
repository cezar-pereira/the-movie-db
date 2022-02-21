import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final themeApp = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    elevation: 0,
    titleTextStyle: TextStyle(
        color: Color(0xFF3C3D4A), fontSize: 18, fontWeight: FontWeight.w500),
  ),
);
