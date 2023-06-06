import 'package:flutter/material.dart';
import 'package:momo_messagner/common/theme/extension/momo_theme_extension.dart';

class MomoIconButton extends StatelessWidget {
  const MomoIconButton({
    super.key,
    required this.onPreesed,
    required this.icon,
    this.iconColor,
    this.iconSize,
    this.minWidth,
  });

  final VoidCallback onPreesed;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPreesed,
        splashColor: Colors.transparent,
        splashRadius: 22,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(minWidth: minWidth ?? 40),
        iconSize: iconSize ?? 22,
        icon: Icon(
          icon,
          color: iconColor ?? context.theme.greyColor,
        ));
  }
}
