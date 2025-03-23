import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.blue[900],
      secondary: Colors.blue[700],
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[900],
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.lightBlue[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
