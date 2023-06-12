import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momo/common/theme/extension/momo_theme_extension.dart';
import 'package:momo/common/utils/momo_colors.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: MomoColors.mainBlueDark,
        onPrimary: MomoColors.backDark,
        secondary: MomoColors.subBlueDark,
        onSecondary: MomoColors.backDark,
        error: MomoColors.subGreyDark,
        onError: MomoColors.backDark,
        background: MomoColors.backDark,
        onBackground: MomoColors.mainBlueDark,
        surface: MomoColors.mainBlueDark,
        onSurface: MomoColors.backDark),
    scaffoldBackgroundColor: MomoColors.backDark,
    extensions: [
      MomoThemeExtension.darkMode,
    ],
    appBarTheme: const AppBarTheme(
      backgroundColor: MomoColors.backGrey,
      titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: MomoColors.subGreyDark),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: MomoColors.subGreyDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: MomoColors.mainBlueDark,
      foregroundColor: MomoColors.backDark,
      splashFactory: NoSplash.splashFactory,
      elevation: 0,
      shadowColor: Colors.transparent,
    )),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: MomoColors.backGrey,
      modalBackgroundColor: MomoColors.backGrey,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
    ),
    tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: MomoColors.mainBlueDark, width: 2),
        ),
        unselectedLabelColor: MomoColors.subGreyDark,
        labelColor: MomoColors.mainBlueDark),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: MomoColors.mainBlueDark,
        foregroundColor: Colors.white),
    dialogBackgroundColor: MomoColors.backGrey,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
