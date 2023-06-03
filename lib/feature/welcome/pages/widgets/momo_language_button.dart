import 'package:flutter/material.dart';
import 'package:momo_messagner/common/theme/extension/momo_theme_extension.dart';

class MomoLanguageButton extends StatelessWidget {
  const MomoLanguageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.langBtnBgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: const Color(0xFF09141A),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(
              Icons.language,
              color: context.theme.blueColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '한국어',
              style: TextStyle(color: context.theme.blueColor),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: context.theme.blueColor,
            )
          ]),
        ),
      ),
    );
  }
}
