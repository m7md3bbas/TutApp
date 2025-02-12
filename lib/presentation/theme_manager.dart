import 'package:flutter/material.dart';
import 'package:tutapp/presentation/color_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.lightPrimaryColor,
    primaryColorDark: ColorManager.darkPrimaryColor,
    disabledColor: ColorManager.grey1,

    // card view theme

    //button theme

    // app bar theme

    // text theme

    // input decoration theme
  );
}
