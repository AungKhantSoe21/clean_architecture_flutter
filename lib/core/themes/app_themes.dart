import 'common/app_bar_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme()
  );
}

ThemeData dartTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme()
  );
}