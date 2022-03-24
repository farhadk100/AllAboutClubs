import 'dart:ui';
import 'package:flutter/material.dart';

class Styles {

  static Styles _instance = Styles._();

  static Styles get instance => _instance;

  double veryBigFont = 25.0;
  double bigFont = 20.0;
  double mediumFont = 17.0;
  double smallFont = 15.0;
  double verySmallFont = 13.0;
  double almostSuperSmallFont = 11.0;
  double superSmallFont = 10.0;
  double padding3 = 3.0;
  double padding5 = 5.0;
  double padding10 = 10.0;
  double padding12 = 12.0;
  double padding15 = 15.0;
  double padding20 = 20.0;
  double padding40 = 40.0;
  double slideShowHeight = 40.0;
  Color mainColor = Colors.red;
  Color mainColor50 = Colors.red.shade50;
  Color mainColor100 = Colors.red.shade100;
  Color backgroundColor = Color.fromARGB(255, 235, 238, 247);
  double pixelRatio = 1;
  double width = 0;
  double height = 0;
  bool isDark = false;

  Styles._(){
    width = window.physicalSize.width;
    height = window.physicalSize.height;
    print ('$height $width');
    pixelRatio = window.devicePixelRatio * 160;
    if (height > width)
      //pixelRatio = height == 0 ? 1.0 : (height > 1300 ? 0.9 : (height > 1079 ? 1.0 : (height > 719 ? 1.1 : (height < 500 ? 1.4 : 2.0 / (2.0 - height/width)))));
      pixelRatio = width / pixelRatio;
    else
    //  pixelRatio = width == 0 ? 1.0 : (width > 1300 ? 0.9 : (width > 1079 ? 1.0 : (width > 719 ? 1.1 : (width < 500 ? 1.4 : 2.0 / (2.0 - width/height)))));
      pixelRatio = height / pixelRatio;
    pixelRatio = (pixelRatio / 2.57) - 1.0;
    print(pixelRatio);
//    if (pixelRatio > 0 && pixelRatio < 0.1)
//      pixelRatio = 1.0;
    if (pixelRatio.isNegative)
      pixelRatio = 1 - (pixelRatio);
    else
      pixelRatio = 1.0;
    print('pixel Ratio is: $pixelRatio');
    veryBigFont = 25.0 / pixelRatio;
    bigFont = 20.0 / pixelRatio;
    mediumFont = 17.0 / pixelRatio;
    smallFont = 15.0 / pixelRatio;
    verySmallFont = 13.0 / pixelRatio;
    almostSuperSmallFont = 11.0 / pixelRatio;
    superSmallFont = 10.0 / pixelRatio;
    padding3 = 3.0 / pixelRatio;
    padding5 = 5.0 / pixelRatio;
    padding10 = 10.0 / pixelRatio;
    padding12 = 12.0 / pixelRatio;
    padding15 = 15.0 / pixelRatio;
    padding20 = 20.0 / pixelRatio;
    padding40 = 40.0 / pixelRatio;
    slideShowHeight = 40.0 / pixelRatio;
  }



  TextStyle textStyle({color, fontSize, fontFamily, backgroundColor, fontWeight, bool strikeThrough = false, bool underline = false, bool shadow = false}) {
    return TextStyle(
        fontSize: fontSize == null ? smallFont : fontSize,
        color: color == null ? (isDark ? Colors.white : Colors.black) : color,
        backgroundColor: backgroundColor == null ? null : backgroundColor,
        fontWeight: fontWeight == null ? null : fontWeight,
        decoration: strikeThrough ? TextDecoration.lineThrough : (underline ? TextDecoration.underline : TextDecoration.none),
        shadows: shadow ? [
          Shadow(
            color: Colors.black,
            offset: Offset(1.0,1.0),
            blurRadius: 3.0
          ),
          Shadow(
              color: Colors.black,
              offset: Offset(1.0,1.0),
              blurRadius: 3.0
          ),
        ] : [],
    );
  }

}
