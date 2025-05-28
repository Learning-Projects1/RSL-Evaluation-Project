import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xffffffff);
  static const Color secondaryGrey = Color(0xffF1F3F4);
  static const Color secondaryMediumGrey = Color(0xff0000004D);
  static const Color primaryBlack = Color(0xff141915);
  static const Color secondaryDarkGrey = Color(0xff606260);
  static const Color primaryDarkGrey = Color(0xff414141);
  static const Color primaryBlue = Color(0xFF2E2739);
  static const primaryGreen = Color(0xff02a099);
  static const Color primaryGrey = Colors.grey;
  static const Color secondaryBlack = Color(0xff2B2F2C);
  static const Color primaryRed = Color(0xffaf131a);
  static const Color drawerRed = Color(0xffb4393d);
  static const Color secondaryRed = Color(0xffE2173A);
  static const Color primaryShadowGrey = Color(0xffBABABA);
  static const Color primaryYellow = Color(0xffE2B317);
  static const Color gradient1 = Color(0xFF2E2739);
  static const Color gradient2 = Color(0xFF49BEE8);
  static Color tabsBackground = Color(0xff239DD1);

  static const lightPurple = Color(0xff825ef6);
  static const darkPurple = Color(0xff3b31a3);

  static const grey50 = Color(0xff94a0b4);
  static const grey100 = Color(0xffF7F9FC);
  static const grey200 = Color(0xffEEF2F8);
  static const grey300 = Color(0xffdce1ea);
  static const grey400 = Color(0xffBAC3D2);
  static const grey500 = Color(0xff94A0B4);
  static const grey600 = Color(0xff717E95);
  static const grey666 = Color(0xff666666);
  static const grey800 = Color(0xff636773);
  static const grey900 = Color(0xff293345);

  ThemeData get themeData {
    ColorScheme colorSchemeTechAdmin = const ColorScheme(
      // primary green
      primary: Color(0xff2E2739),
      // primary blue
      primaryContainer: Color(0xff239DD1),
      // gradient 1
      surface: Color(0xff2E2739),
      // gradient 2
      background: Color(0xffF1F3F4),
      // secondary grey
      //secondary: Color(0xffF1F3F4),
      secondary: Color(0xff2E2739),
      // secondary dark grey
      secondaryContainer: Color(0xff606260),
      // secondary red
      error: Color(0xffE2173A),
      // primary green
      onPrimary: Color(0xFFFFFFFF),
      // primary blue
      onSecondary: Color(0xff239DD1),
      // secondary grey
      onSurface: Color(0xff2E2739),
      // secondary dark grey
      onBackground: Color(0xff606260),
      // secondary red
      onError: Color(0xffE2173A),
      // white
      brightness: Brightness.light,
    );

    return ThemeData.from(colorScheme: colorSchemeTechAdmin);
  }
}