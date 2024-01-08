import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Font {
  static TextStyle getAppFont({
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.inter(
        textStyle: TextStyle(
      height: height,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ));
  }
}

class BigFont{
    static  final primary = Font.getAppFont(
        fontSize:40,
        color: Colors.black,
        fontWeight: FontWeight.w700
    );
}

class SmallFont {
    static  final primary = Font.getAppFont(
        fontSize:20,
        color: Colors.black,
        fontWeight: FontWeight.w600
    );

    static  final secondary = Font.getAppFont(
        fontSize:20,
        color: Colors.white,
        fontWeight: FontWeight.w600
    );
}

class MediumFont {
    static  final primary = Font.getAppFont(
        fontSize:30,
        color: Colors.black,
        fontWeight: FontWeight.w600
    );
}

class HintFont{
  static  final primary = Font.getAppFont(
        fontSize:20,
        color: Colors.black45,
    );
}

class TextFieldFont{
  static  final primary = Font.getAppFont(
        fontSize:25,
        color: Colors.black,
    );
}