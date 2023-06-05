import 'package:flutter/material.dart';
import 'package:momo_messagner/common/theme/extension/momo_theme_extension.dart';
import 'package:momo_messagner/common/utils/momo_colors.dart';

class MomoTextField extends StatelessWidget {
  const MomoTextField(
      {super.key,
      this.textEditingController,
      this.hintText,
      this.readOnly,
      this.textAlign,
      this.keyBoardType,
      this.prefixText,
      this.onTap,
      this.suffixIcon,
      this.onChanged});

  final TextEditingController? textEditingController;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? prefixText;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: textEditingController,
      readOnly: readOnly ?? false,
      textAlign: textAlign ?? TextAlign.center,
      keyboardType: readOnly == null ? keyBoardType : null,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        prefixText: prefixText,
        suffix: suffixIcon,
        hintStyle: TextStyle(color: context.theme.greyColor),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: MomoColors.mainBlueDark)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: MomoColors.mainBlueDark, width: 2)),
      ),
    );
  }
}
