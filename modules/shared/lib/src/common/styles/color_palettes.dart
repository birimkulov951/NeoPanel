import 'package:flutter/material.dart';

class ColorPalettes{

  static Color deepPurple = Color(0xFF8973C6);
  static Color deepPurpleStroke = Color(0xFFF1ECFF);
  static Color lightPurple = Color(0xffA31E80);
  static Color softPurple = Color(0xffBC8DB9);
  static Color purpleGreyStroke = Color(0xffD8CAFF);

  static Color greyStroke = Color(0xFFD2D2D6);
  static Color boardViewCardStroke = Color(0xFFD8CAFF);

  static Color lightGreen = Color(0xFF6CA801);
  static Color iconGreen = Color(0xFF01A659);

  static Color textColorBlack = Color(0xFF353535);
  static Color textColorGrey = Color(0xFF787885);
  static Color textColorBlue = Color(0xFF0C5086);

  static Color borderColor = Color(0xFFF1ECFF);

  static Color radioGreyColor = Color(0xFFAEAEB2);
  static Color greyButton = Color(0xFF979797);
  static Color greyBg = Color(0xffE0E0E1);




  //Colors for theme
  static Color lightPrimary = Color(0xFF8973C6);
  static Color darkPrimary = Color(0xFF8973C6);
  static Color lightAccent = Color(0xFF01A659);
  static Color darkAccent = Color(0xFF01A659);
  static Color lightBG = Color(0xFFFAFAFA);
  static Color darkBG = Color(0xff212121);

  static Color white = Color(0xffffffff);
  static Color whiteSemiTransparent = Colors.white70;
  static Color grey = Colors.grey;
  static Color red = Color(0xffEB4134);
  static Color yellow = Colors.yellow;
  static Color green = Colors.green;
  static Color setActive = Colors.grey[500];
  static Color blueGrey = Colors.blueGrey;
  static Color black = Color(0xFF000000);
  static Color black12 = Colors.black12;
  static Color transparent = Color(0x00000000);

  static Color getColorCircleProgress(double s) {
    Color r = ColorPalettes.red;
    if (s > 4.5 && s < 7)
      r = ColorPalettes.yellow;
    else if (s >= 7) r = ColorPalettes.green;
    return r;
  }

}