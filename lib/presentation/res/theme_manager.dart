import 'package:flutter/material.dart';
import 'package:tutapp/presentation/res/color_manager.dart';
import 'package:tutapp/presentation/res/font_manager.dart';
import 'package:tutapp/presentation/res/style_manager.dart';
import 'package:tutapp/presentation/res/values_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.lightPrimaryColor,
    primaryColorDark: ColorManager.darkPrimaryColor,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimaryColor,

    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.greyColor,
      elevation: AppSize.s4,
    ),
    //button theme
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primaryColor,
      splashColor: ColorManager.lightPrimaryColor,
    ),
    //elevation button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSizes.s17),
        backgroundColor: ColorManager.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primaryColor,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimaryColor,
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSizes.s16),
    ),
    // text theme
    textTheme: TextTheme(
      displayLarge:
          getLightStyle(color: ColorManager.white, fontSize: FontSizes.s22),
      headlineLarge: getSemiBoldStyle(
          color: ColorManager.darkGreyColor, fontSize: FontSizes.s16),
      titleMedium: getMediumStyle(
          color: ColorManager.lightGreyColor, fontSize: FontSizes.s14),
      bodyMedium: getRegularStyle(
          color: ColorManager.lightGreyColor, fontSize: FontSizes.s14),
    ),
    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularStyle(
          color: ColorManager.greyColor,
          fontSize: FontSizes.s14,
        ),
        labelStyle: getRegularStyle(
            color: ColorManager.greyColor, fontSize: FontSizes.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.grey1),
            borderRadius: BorderRadius.circular(AppSize.s8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primaryColor),
            borderRadius: BorderRadius.circular(AppSize.s8))),
  );
}
