import 'package:flutter/material.dart';

class MomoElevatedButton extends StatelessWidget {
  const MomoElevatedButton({
    super.key,
    this.buttonWidth,
    required this.onPressed,
    required this.text,
    this.padding,
  });

  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: buttonWidth ?? MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: padding ?? const EdgeInsets.fromLTRB(5, 5, 5, 5)),
        child: Text(
          text,
        ),
      ),
    );
  }
}
