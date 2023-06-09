import 'package:flutter/material.dart';
import 'package:momo/common/theme/extension/momo_theme_extension.dart';

class MomoIconButton extends StatelessWidget {
  const MomoIconButton({
    super.key,
    required this.onPreesed,
    required this.icon,
    this.iconColor,
    this.iconSize,
    this.minWidth,
    this.bgColor,
    this.border,
  });

  final VoidCallback onPreesed;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final double? minWidth;
  final Color? bgColor;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: bgColor, border: border, shape: BoxShape.circle),
      child: IconButton(
          onPressed: onPreesed,
          splashColor: Colors.transparent,
          splashRadius: (minWidth ?? 45) - 25,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
              minWidth: minWidth ?? 45, minHeight: minWidth ?? 45),
          iconSize: iconSize ?? 22,
          icon: Icon(
            icon,
            color: iconColor ?? context.theme.greyColor,
          )),
    );
  }
}
