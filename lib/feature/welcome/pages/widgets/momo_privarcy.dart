import 'package:flutter/material.dart';
import 'package:momo/common/theme/extension/momo_theme_extension.dart';

class MomoPrivacy extends StatelessWidget {
  const MomoPrivacy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: RichText(
          text: TextSpan(
              text: '개인 보호 정책 ',
              style: TextStyle(color: context.theme.blueColor),
              children: [
            TextSpan(
              text: '을 동의하고 계속하기 버튼을 눌러주세요.',
              style: TextStyle(color: context.theme.greyColor, height: 1.5),
            )
          ])),
    );
  }
}
