import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/color_manager.dart';

class AppThemeData{
  ThemeData themeData = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
    primaryColor: ColorManager.primaryColor,
    
  );
}