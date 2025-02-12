import 'package:flutter/material.dart';
import 'package:tutapp/presentation/font_manager.dart';

TextStyle _getTextStyle(
    {required Color color,
    required double fontSize,
    required FontWeight fontWeight}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: FontConstats.fontFamily);
}

TextStyle getRegularStyle(
    {required Color color, double fontSize = FontSizes.s12}) {
  return _getTextStyle(
      color: color, fontSize: fontSize, fontWeight: FontWeights.regular);
}

TextStyle getMediumStyle(
    {required Color color, double fontSize = FontSizes.s12}) {
  return _getTextStyle(
      color: color, fontSize: fontSize, fontWeight: FontWeights.medium);
}

TextStyle getSemiBoldStyle(
    {required Color color, double fontSize = FontSizes.s12}) {
  return _getTextStyle(
      color: color, fontSize: fontSize, fontWeight: FontWeights.semiBold);
}

TextStyle getBoldStyle(
    {required Color color, double fontSize = FontSizes.s12}) {
  return _getTextStyle(
      color: color, fontSize: fontSize, fontWeight: FontWeights.bold);
}

TextStyle getLightStyle(
    {required Color color, double fontSize = FontSizes.s12}) {
  return _getTextStyle(
      color: color, fontSize: fontSize, fontWeight: FontWeights.light);
}
