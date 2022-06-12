/* !structure 
  1- FontNameManger
  2- FontWeightManager 
  3- FontSizeManger
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontNameManger {
  static const String poppinsFontName = "poppins";
}

class FontSize {
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontManager {
  TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, double height,
      {Color color = Colors.black}) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: color,
      fontWeight: fontWeight,
      height: height,
    );
  }

  TextStyle getRegularStyle(
      {double fontSize = FontSize.s12,
      double height = 1,
      Color color = Colors.black}) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.regular,
      height,
      color: color,
    );
  }

  TextStyle getBoldStyle(
      {double fontSize = FontSize.s12,
      double height = 1,
      Color color = Colors.black}) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.bold,
      height,
      color: color,
    );
  }

  TextStyle getSemiBoldStyle(
      {double fontSize = FontSize.s12,
      double height = 1,
      Color color = Colors.black}) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.semiBold,
      height,
      color: color,
    );
  }

  TextStyle getMediumStyle(
      {double fontSize = FontSize.s12,
      double height = 1,
      Color color = Colors.black}) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.medium,
      height,
      color: color,
    );
  }
}
