import 'package:flutter/material.dart';

class ColorManager {
  static Color primaryColor = HexColor.fromHex("F2F6F9");
  static Color secondaryColor = HexColor.fromHex("3D5CFF");
  static Color scaffoldBackgroundColor = HexColor.fromHex("#2F6F9");
  static Color fontColor = HexColor.fromHex("FF6905");
  static Color backgroundButtonColor = HexColor.fromHex("FFEBF0");
  static Color foregroundButtonColor = HexColor.fromHex("FF6905");
  static Color secondBackgroundButtonColor = HexColor.fromHex("F4F3FD");
  static Color borderColor = HexColor.fromHex("707070");
}

class LinearGradientManager {
  static LinearGradient courseSlider = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      HexColor.fromHex("FFFFFF").withOpacity(0.1),
      HexColor.fromHex("FF5106"),
    ],
  );
  static LinearGradient choosePaymentButtom = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topCenter,
    colors: [
      HexColor.fromHex("1F2E80"),
      HexColor.fromHex("3D5CFF"),
    ],
  );
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    //* * to check the opacity of the color
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString;
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
