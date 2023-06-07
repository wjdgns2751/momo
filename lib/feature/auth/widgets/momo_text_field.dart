import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momo/common/theme/extension/momo_theme_extension.dart';
import 'package:momo/common/utils/momo_colors.dart';

class MomoTextField extends StatelessWidget {
  const MomoTextField({
    super.key,
    this.textEditingController,
    this.hintText,
    this.readOnly,
    this.textAlign,
    this.keyBoardType,
    this.prefixText,
    this.onTap,
    this.suffixIcon,
    this.onChanged,
    this.fontSize,
    this.autoFocus,
    this.maxLength,
    this.letterSpacing,
    this.inputFormatters,
    this.validator,
  });

  final TextEditingController? textEditingController;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? prefixText;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final double? fontSize;
  final bool? autoFocus;
  final int? maxLength;
  final double? letterSpacing;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      onTap: onTap,
      controller: textEditingController,
      readOnly: readOnly ?? false,
      textAlign: textAlign ?? TextAlign.center,
      keyboardType: readOnly == null ? keyBoardType : null,
      onChanged: onChanged,
      style: TextStyle(fontSize: fontSize, letterSpacing: letterSpacing),
      autofocus: autoFocus ?? false,
      validator: validator,
      decoration: InputDecoration(
        counterStyle: const TextStyle(color: Colors.transparent),
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: context.theme.greyColor,
        ),
        prefixText: prefixText,
        suffix: suffixIcon,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: MomoColors.mainBlueDark)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: MomoColors.mainBlueDark, width: 2)),
      ),
    );
  }
}
