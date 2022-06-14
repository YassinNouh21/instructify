import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/font_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

ThemeData getApplicationTheme(context) {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
    primaryColor: ColorManager.primaryColor,
    textTheme: TextTheme(
      headline5: getRegularStyle(
        fontSize: SizeManager.s25,
        height: SizeManager.s1,
      ),
      headline6: getRegularStyle(
        fontSize: SizeManager.s20,
        height: SizeManager.s1,
      ),
      button: getRegularStyle(
        color: Colors.white,
        fontSize: SizeManager.s16,
        height: SizeManager.s1,
      ),
      subtitle1: getRegularStyle(
        fontSize: SizeManager.s16,
        height: SizeManager.s1,
      ),
      subtitle2: getBoldStyle(
        fontSize: SizeManager.s14,
        height: SizeManager.s1,
      ),
      caption: getRegularStyle(
        fontSize: SizeManager.s12,
        height: SizeManager.s1,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeManager.s8))),
        backgroundColor: MaterialStateProperty.all(ColorManager.secondaryColor),
        alignment: Alignment.center,
        fixedSize: MaterialStateProperty.all(
            const Size(SizeManager.s325, SizeManager.s60)),
        textStyle: MaterialStateProperty.all(
          getRegularStyle(
            color: Colors.white,
            fontSize: SizeManager.s16,
            height: SizeManager.s1,
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeManager.s8))),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        alignment: Alignment.center,
        fixedSize: MaterialStateProperty.all(
          const Size(SizeManager.s325, SizeManager.s60),
        ),
        textStyle: MaterialStateProperty.all(
          getRegularStyle(
            color: Colors.white,
            fontSize: SizeManager.s16,
            height: SizeManager.s1,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeManager.s8))),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.all(
          getRegularStyle(
            fontSize: SizeManager.s16,
            height: SizeManager.s1,
          ).copyWith(decoration: TextDecoration.underline),
        ),
      ),
    ),
  );
}
