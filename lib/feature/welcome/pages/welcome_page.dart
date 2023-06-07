import 'package:flutter/material.dart';
import 'package:momo/common/routes/routes.dart';
import 'package:momo/common/theme/extension/momo_theme_extension.dart';
import 'package:momo/common/utils/widgets/momo_elevated_button.dart';
import 'package:momo/feature/welcome/pages/widgets/momo_language_button.dart';
import 'package:momo/feature/welcome/pages/widgets/momo_privarcy.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  navigateToLoginPage(context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.loginPage,
      (route) => false,
    );
  }

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
        Expanded(
            child: Column(
          children: [
            const Text(
              '모모를 이용해주셔서 감사합니다.',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const MomoPrivacy(),
            MomoElevatedButton(
              onPressed: () => navigateToLoginPage(context),
              text: '동의하고 계속하기',
            ),
            const SizedBox(height: 50),
            const MomoLanguageButton()
          ],
        )),
      ]),
    );
  }
}
