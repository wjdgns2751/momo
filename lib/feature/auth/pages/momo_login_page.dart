import 'package:flutter/material.dart';
import 'package:momo_messagner/common/theme/extension/momo_theme_extension.dart';
import 'package:momo_messagner/common/utils/momo_colors.dart';
import 'package:momo_messagner/common/utils/widgets/momo_custom_button.dart';
import 'package:momo_messagner/feature/auth/widgets/momo_text_field.dart';

class MomoLoginPage extends StatefulWidget {
  const MomoLoginPage({super.key});

  @override
  State<MomoLoginPage> createState() => _MomoLoginPageState();
}

class _MomoLoginPageState extends State<MomoLoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    countryNameController = TextEditingController(text: '한국');
    countryCodeController = TextEditingController(text: '82');
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          '본인인증',
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              splashColor: Colors.transparent,
              splashRadius: 22,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 40),
              icon: Icon(
                Icons.more_vert_outlined,
                color: context.theme.greyColor,
              ))
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '본인인증을 사용하셔야만 서비스를 이용하실 수 있습니다.  ',
                style: TextStyle(color: context.theme.greyColor, height: 1.5),
                children: [
                  TextSpan(
                      text: " 스마트폰 번호는 무엇입니까?",
                      style: TextStyle(color: context.theme.blueColor))
                ]),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: MomoTextField(
            onTap: () {},
            textEditingController: countryNameController,
            readOnly: true,
            suffixIcon: const Icon(
              Icons.arrow_drop_down,
              color: MomoColors.mainBlueDark,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              SizedBox(
                width: 70,
                child: MomoTextField(
                  onTap: () {},
                  textEditingController: countryCodeController,
                  prefixText: '+',
                  readOnly: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: MomoTextField(
                textEditingController: phoneNumberController,
                hintText: 'ex) 1012345678',
                textAlign: TextAlign.left,
                keyBoardType: TextInputType.number,
              ))
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text('통신사 요금이 부과될 수 있습니다.',
            style: TextStyle(color: context.theme.greyColor))
      ]),
      floatingActionButton: MomoCustomButton(
        onPressed: () {},
        text: '계속하기',
        buttonWidth: 90,
      ),
    );
  }
}
