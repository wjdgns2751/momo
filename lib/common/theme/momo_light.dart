import 'package:flutter/material.dart';
import 'package:momo_messagner/common/theme/extension/momo_theme_extension.dart';
import 'package:momo_messagner/common/utils/momo_colors.dart';

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
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: MomoColors.mainBlueLight,
        foregroundColor: MomoColors.backLight,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      )));
}
