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
      backgroundColor: MomoColors.mainBlueLight,
      titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
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
        ),
      ),
    ),
    tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        unselectedLabelColor: Color.fromARGB(255, 179, 214, 217),
        labelColor: Colors.white),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: MomoColors.mainBlueDark,
        foregroundColor: Colors.white),
    dialogBackgroundColor: MomoColors.backLight,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
