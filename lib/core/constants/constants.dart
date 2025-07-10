import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppConstants {
  static const String baseUrlImage = "https://dunijet.ir/content/projects/hotelino";
  static const String hotelsData = "assets/data/hotels.json";
}

class AppColors {
  static const Color primary = Color(0xFFB27258);

  //Light theme colors
  static const Color lightText = Colors.black;
  static const Color lightHint = Colors.grey;
  static const Color lightInputFill = Color(0xFFF5F5F5);
  static const Color lightBorder = Colors.grey;
  static const Color lightFocusedBorder = Colors.brown;

  //dark theme colors
  static const Color darkText = Colors.white;
  static const Color darkHint = Colors.grey;
  static const Color darkInputFill = Color(0xFF303030);
  static const Color darkBorder = Color(0xFF707070);
  static const Color darkFocusedBorder = Colors.brown;
  static const Color darkButton = Color(0xFF5D4037);
}