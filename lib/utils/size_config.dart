import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData mediaQueryData; // Declare as late
  static double screenWidth = 0; // Initialize with default value
  static double screenHeight = 0; // Initialize with default value
  static double defaultSize = 0; // Initialize with default value
  static Orientation? orientation; // Make nullable

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    orientation = mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
