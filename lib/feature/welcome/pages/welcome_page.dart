import 'package:flutter/material.dart';
import 'package:momo_messagner/common/theme/extension/momo_theme_extension.dart';
import 'package:momo_messagner/feature/welcome/pages/widgets/momo_language_button.dart';
import 'package:momo_messagner/feature/welcome/pages/widgets/momo_privarcy.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            "assets/images/elect.png",
            color: context.theme.momoImageColor,
          ),
        )),
        const SizedBox(
          height: 40,
        ),
        const Expanded(
            child: Column(
          children: [
            Text(
              '모모를 이용해주셔서 감사합니다.',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            MomoPrivacy(),
            // MomoElevatedButton(
            //   onPressed: () {},
            //   text: '동의하고 계속하기',
            // ),
            SizedBox(height: 50),
            MomoLanguageButton()
          ],
        )),
      ]),
    );
  }
}
