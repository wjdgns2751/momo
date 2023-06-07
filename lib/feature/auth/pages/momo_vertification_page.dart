import 'package:flutter/material.dart';
import 'package:momo/common/theme/extension/momo_theme_extension.dart';
import 'package:momo/common/utils/widgets/momo_icon_button.dart';
import 'package:momo/feature/auth/widgets/momo_text_field.dart';

class MomoVerificationPage extends StatefulWidget {
  const MomoVerificationPage(
      {super.key, required this.id, required this.phoneNumber});

  final String id;
  final String phoneNumber;

  @override
  State<MomoVerificationPage> createState() => _MomoVerificationPageState();
}

class _MomoVerificationPageState extends State<MomoVerificationPage> {
  late TextEditingController codeController;

  @override
  void initState() {
    codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          '인증 화면',
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        centerTitle: true,
        actions: [MomoIconButton(onPreesed: () {}, icon: Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                text: TextSpan(
                    style:
                        TextStyle(color: context.theme.greyColor, height: 1.5),
                    children: [
                      const TextSpan(
                          text: '인증번호가 오지 않는다면 +82-1234-5678 로 연락부탁드립니다.'),
                      TextSpan(
                          text: '잘못된 번호?',
                          style: TextStyle(color: context.theme.blueColor))
                    ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MomoTextField(
                hintText: '- - -  - - -',
                fontSize: 30,
                autoFocus: true,
                keyBoardType: TextInputType.number,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '6 자리의 코드를 입력하세요.',
              style: TextStyle(color: context.theme.greyColor),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.message,
                  color: context.theme.greyColor,
                ),
                const SizedBox(width: 20),
                Text(
                  'SMS 문의',
                  style: TextStyle(color: context.theme.greyColor),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              color: context.theme.blueColor!.withOpacity(0.2),
            ),
            Row(
              children: [
                Icon(
                  Icons.call,
                  color: context.theme.greyColor,
                ),
                const SizedBox(width: 20),
                Text(
                  '유선 문의',
                  style: TextStyle(color: context.theme.greyColor),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
