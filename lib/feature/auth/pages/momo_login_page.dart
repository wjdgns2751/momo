import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:momo_messagner/common/helper/momo_alert_dialog.dart';
import 'package:momo_messagner/common/theme/extension/momo_theme_extension.dart';
import 'package:momo_messagner/common/utils/momo_colors.dart';
import 'package:momo_messagner/common/utils/widgets/momo_elevated_button.dart';
import 'package:momo_messagner/common/utils/widgets/momo_icon_button.dart';
import 'package:momo_messagner/feature/auth/widgets/momo_masked_formatter.dart';
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
  bool isButtonEnabled = false;
  CancelableOperation<void>? debouncedSetState;

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

  showCountryCodePicker() {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        // favorite: ['KR'],
        searchAutofocus: true,
        countryFilter: [
          'KR',
        ],
        countryListTheme: CountryListThemeData(
          bottomSheetHeight: 400,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          flagSize: 22,
          borderRadius: BorderRadius.circular(20),
          textStyle: TextStyle(color: context.theme.greyColor),
          inputDecoration: InputDecoration(
            labelStyle: TextStyle(color: context.theme.greyColor),
            prefixIcon: const Icon(
              Icons.language_outlined,
              color: MomoColors.mainBlueDark,
            ),
            hintText: '국가를 선택해주세요.',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: context.theme.greyColor!.withOpacity(0.2),
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: MomoColors.mainBlueDark,
              ),
            ),
          ),
        ),
        onSelect: (value) {
          countryNameController.text = value.name;
          countryCodeController.text = value.phoneCode;
        });
  }

  sendInfoToPhone() {
    final phone = phoneNumberController.text;
    final name = countryNameController.text;

    if (phone.isEmpty) {
      return showAlertDialog(context: context, message: '핸드폰 번호를 입력해주세요.');
    } else if (phone.length < 9) {
      return showAlertDialog(
          context: context, message: '$name 코드를 제외한 핸드폰 번호 $phone 가 짧습니다. ');
    } else if (phone.length > 11) {
      return showAlertDialog(
          context: context,
          message: '$name  코드를 제외한 핸드폰 번호 $phone 가 유효하지 않습니다. ');
    }
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
        // actions: [MomoIconButton()],
        actions: [
          MomoIconButton(
            onPreesed: () {},
            icon: Icons.more_vert,
          )
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
          child: Row(
            children: [
              SizedBox(
                width: 40,
                child: MomoTextField(
                  // onTap: showCountryCodePicker,
                  textEditingController: countryCodeController,
                  prefixText: '+',
                  readOnly: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MomoTextField(
                  inputFormatters: [
                    MomoMaskedTextInputFormatter(masks: [
                      'xxx-xxxx-xxxx',
                      'xxx-xxx-xxxx',
                      'xxx-xxxx-xxx'
                    ], separator: '-')
                  ],
                  textEditingController: phoneNumberController,
                  hintText: '',
                  keyBoardType: TextInputType.number,
                  onChanged: (value) {
                    debouncedSetState?.cancel();
                    debouncedSetState = CancelableOperation.fromFuture(
                      Future.delayed(const Duration(milliseconds: 300), () {
                        // Perform the actual setState operation
                        setState(() {
                          isButtonEnabled =
                              RegExp(r'^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$')
                                  .hasMatch(value);
                        });
                      }),
                    );
                  },
                ),
              ),
              isButtonEnabled ? const SizedBox(width: 30) : const SizedBox(),
              isButtonEnabled
                  ? MomoElevatedButton(
                      onPressed: isButtonEnabled ? sendInfoToPhone : () {},
                      text: '인증',
                      buttonWidth: 50,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: MomoTextField(
            maxLength: 6,
            letterSpacing: 6,
            hintText: '_ _ _  _ _ _',
            fontSize: 22,
            autoFocus: true,
            keyBoardType: TextInputType.number,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text('통신사 요금이 부과될 수 있습니다.',
            style: TextStyle(color: context.theme.greyColor))
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MomoElevatedButton(
        onPressed: sendInfoToPhone,
        text: '다음으로',
        buttonWidth: 88,
      ),
    );
  }
}
