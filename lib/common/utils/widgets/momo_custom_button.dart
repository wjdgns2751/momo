import 'package:flutter/material.dart';

class MomoCustomButton extends StatelessWidget {
  const MomoCustomButton({
    super.key,
    this.buttonWidth,
    required this.onPressed,
    required this.text,
  });

  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: buttonWidth ?? MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
