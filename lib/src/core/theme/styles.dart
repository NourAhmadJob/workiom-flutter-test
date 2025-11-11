import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color? color) {
  return TextStyle(
    fontFamily: FontManager.fontFamily,
    color: color ?? AppColors.black,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s32,  Color? color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getLightStyle(
    {double fontSize = FontSize.s16,  Color? color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s16,  Color? color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getBoldStyle({double fontSize = FontSize.s16,  Color? color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s16,  Color? color}) {
    return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
