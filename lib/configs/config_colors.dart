import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_color/random_color.dart';

enum RandomColorMode { dark, light, random }

class ConfigColor {
  ConfigColor();
  static final Color primaryColor = getColorFromHex('#7CC623'); //Light Green
  // static Color primaryColorVariant = getColorFromHex('#002916');
  static final Color secondaryColor = getColorFromHex('#EE9601'); //Orange
  // static Color secondaryColorVariant = getColorFromHex('#D68D18');
  static final Color backgroundColor = getColorFromHex('#F4F4F4'); // Colors.grey[100]!;
  static final Color disabledColor = Colors.grey[400]!;

  static final Color primaryTextColor = getColorFromHex('#004B3E');
  static final Color secondaryTextColor = Colors.white;

  static final Color cardColor = Get.isDarkMode ? Colors.black : Colors.white;
  static final Color badgeColor = getColorFromHex('#FF6961');

  static final Color shimmerHighlightColor = Colors.grey[400]!;
  static final Color shimmerBaseColor = Colors.grey;
  static final Color shimmerInitColor = Colors.grey;

  static final Color bronzeColor = getColorFromHex('#A97142');
  static final Color silverColor = getColorFromHex('#C0C0C0');
  static final Color goldColor = getColorFromHex('#E7D27C');

  static final Color successColor = getColorFromHex('#77DD77');
  static final Color errorColor = getColorFromHex('#FF6961');
  static final Color infoColor = getColorFromHex('#1AA7EC');


  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }

    return Colors.black;
  }

  static Color getRandomColor(RandomColorMode mode) {
    if (mode == RandomColorMode.dark) {
      return RandomColor().randomColor(
          colorBrightness: ColorBrightness.dark,
          colorSaturation: ColorSaturation.mediumSaturation,
          colorHue: ColorHue.random);
    } else if (mode == RandomColorMode.light) {
      return RandomColor().randomColor(
          colorBrightness: ColorBrightness.light,
          colorSaturation: ColorSaturation.lowSaturation,
          colorHue: ColorHue.random);
    }
    return RandomColor().randomColor();
  }
}
