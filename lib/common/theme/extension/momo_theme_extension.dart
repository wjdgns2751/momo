import 'package:flutter/material.dart';
import 'package:momo/common/utils/momo_colors.dart';

extension ExtendedTheme on BuildContext {
  MomoThemeExtension get theme {
    return Theme.of(this).extension<MomoThemeExtension>()!;
  }
}

// static const Color mainBlueDark = Color(0xFF0097a8);
// static const Color mainBlueLight = Color(0xFF007a88);
// static const Color subBlueDark = Color(0xFF00A89F);
// static const Color subBlueLight = Color(0xFF017f78);
// static const Color subGreyDark = Color(0xFF8696A0);
// static const Color subGreyLight = Color(0xFF707d85);
// static const Color backDark = Color(0xFF111B21);
// static const Color backLight = Color(0xFFFFFFFF);

class MomoThemeExtension extends ThemeExtension<MomoThemeExtension> {
  static MomoThemeExtension lightMode = MomoThemeExtension(
    momoImageColor: MomoColors.mainBlueLight,
    blueColor: MomoColors.mainBlueLight,
    greyColor: MomoColors.subGreyLight,
    langBtnBgColor: const Color(0xFFF7F8FA),
    langBtnHighlightColor: const Color(0xFFE8E8ED),
    authAppbarTextColor: MomoColors.mainBlueLight,
    photoIconBgColor: const Color(0xFFF0F2F4),
    photoIconColor: const Color(0xFF9DABB2),
  );

  static MomoThemeExtension darkMode = MomoThemeExtension(
    momoImageColor: MomoColors.mainBlueDark,
    blueColor: MomoColors.mainBlueDark,
    greyColor: MomoColors.subGreyDark,
    langBtnBgColor: const Color(0xFF182229),
    langBtnHighlightColor: const Color(0xFF09141A),
    authAppbarTextColor: const Color(0xFFE9EDEF),
    photoIconBgColor: const Color(0xFF283342),
    photoIconColor: const Color(0xFF61716B),
  );

  final Color? momoImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langBtnBgColor;
  final Color? langBtnHighlightColor;
  final Color? authAppbarTextColor;
  final Color? photoIconBgColor;
  final Color? photoIconColor;

  MomoThemeExtension({
    this.momoImageColor,
    this.greyColor,
    this.blueColor,
    this.langBtnBgColor,
    this.langBtnHighlightColor,
    this.authAppbarTextColor,
    this.photoIconBgColor,
    this.photoIconColor,
  });

  @override
  ThemeExtension<MomoThemeExtension> copyWith({
    Color? momoImageColor,
    Color? greyColor,
    Color? blueColor,
    Color? langBtnBgColor,
    Color? langBtnHighlightColor,
    Color? authAppbarTextColor,
    Color? photoIconBgColor,
    Color? photoIconColor,
  }) {
    return MomoThemeExtension(
      momoImageColor: momoImageColor ?? this.momoImageColor,
      greyColor: greyColor ?? this.greyColor,
      blueColor: blueColor ?? this.blueColor,
      langBtnBgColor: langBtnBgColor ?? this.langBtnBgColor,
      langBtnHighlightColor:
          langBtnHighlightColor ?? this.langBtnHighlightColor,
      authAppbarTextColor: authAppbarTextColor ?? this.authAppbarTextColor,
      photoIconBgColor: photoIconBgColor ?? this.photoIconBgColor,
      photoIconColor: photoIconColor ?? this.photoIconColor,
    );
  }

  @override
  ThemeExtension<MomoThemeExtension> lerp(
      covariant ThemeExtension<MomoThemeExtension>? other, double t) {
    if (other is! MomoThemeExtension) return this;
    return MomoThemeExtension(
      momoImageColor: Color.lerp(momoImageColor, other.momoImageColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      langBtnBgColor: Color.lerp(langBtnBgColor, other.langBtnBgColor, t),
      langBtnHighlightColor:
          Color.lerp(langBtnHighlightColor, other.langBtnHighlightColor, t),
      authAppbarTextColor:
          Color.lerp(authAppbarTextColor, other.authAppbarTextColor, t),
      photoIconBgColor: Color.lerp(photoIconBgColor, other.photoIconBgColor, t),
      photoIconColor: Color.lerp(photoIconColor, other.photoIconColor, t),
    );
  }
}
