import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momo/common/theme/extension/momo_theme_extension.dart';
import 'package:momo/common/utils/momo_colors.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: MomoColors.mainBlueLight,
        onPrimary: MomoColors.backLight,
        secondary: MomoColors.subBlueLight,
        onSecondary: MomoColors.backLight,
        error: MomoColors.subGreyLight,
        onError: MomoColors.backLight,
        background: MomoColors.backLight,
        onBackground: MomoColors.mainBlueLight,
        surface: MomoColors.mainBlueLight,
        onSurface: MomoColors.backLight),
    scaffoldBackgroundColor: MomoColors.backLight,
    extensions: [
      MomoThemeExtension.lightMode,
    ],
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 18),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: MomoColors.mainBlueLight,
      foregroundColor: MomoColors.backLight,
      splashFactory: NoSplash.splashFactory,
      elevation: 0,
      shadowColor: Colors.transparent,
    )),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: MomoColors.backLight,
        modalBackgroundColor: MomoColors.backLight,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ))),
    dialogBackgroundColor: MomoColors.backLight,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
