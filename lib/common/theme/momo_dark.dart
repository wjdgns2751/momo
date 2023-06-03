import 'package:flutter/material.dart';
import 'package:momo_messagner/common/theme/extension/momo_theme_extension.dart';
import 'package:momo_messagner/common/utils/momo_colors.dart';

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
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: MomoColors.mainBlueDark,
        foregroundColor: MomoColors.backDark,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      )));
}
