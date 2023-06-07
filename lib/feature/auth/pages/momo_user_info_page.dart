import 'package:flutter/material.dart';
import 'package:momo_messagner/common/theme/extension/momo_theme_extension.dart';
import 'package:momo_messagner/common/utils/widgets/momo_elevated_button.dart';
import 'package:momo_messagner/feature/auth/widgets/momo_text_field.dart';

class MomoUserInfoPage extends StatefulWidget {
  const MomoUserInfoPage({super.key});

  @override
  State<MomoUserInfoPage> createState() => _MomoUserInfoPageState();
}

class _MomoUserInfoPageState extends State<MomoUserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          '사용자 정보',
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              '사용자 정보를 입력하세요',
              textAlign: TextAlign.center,
              style: TextStyle(color: context.theme.greyColor),
            ),
          ),
          const SizedBox(height: 40),
          Container(
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.theme.photoIconBgColor),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 3, right: 3),
                child: Icon(
                  Icons.add_a_photo_rounded,
                  size: 48,
                  color: context.theme.photoIconColor,
                ),
              )),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Expanded(
                child: MomoTextField(
                  hintText: '이름을 작성하세요.',
                  textAlign: TextAlign.left,
                  autoFocus: true,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.check,
                color: context.theme.photoIconColor,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          )
        ]),
      ),
      floatingActionButton: MomoElevatedButton(
        onPressed: () {},
        text: '다음으로',
        buttonWidth: 88,
      ),
    );
  }
}
