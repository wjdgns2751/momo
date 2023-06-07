import 'package:flutter/material.dart';
import 'package:momo/common/theme/extension/momo_theme_extension.dart';
import 'package:momo/common/utils/momo_colors.dart';

class MomoLanguageButton extends StatelessWidget {
  const MomoLanguageButton({
    super.key,
  });

  momoShowBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 30,
                  decoration: BoxDecoration(
                      color: context.theme.greyColor!.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '사용자 언어',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Divider(
                  color: context.theme.greyColor!.withOpacity(0.3),
                  thickness: 0.5,
                ),
                RadioListTile(
                  value: true,
                  groupValue: true,
                  onChanged: (value) {},
                  activeColor: MomoColors.mainBlueDark,
                  title: const Text('한국어'),
                  subtitle: Text(
                    "설정 언어",
                    style: TextStyle(color: context.theme.greyColor),
                  ),
                ),
                RadioListTile(
                  value: true,
                  groupValue: false,
                  onChanged: (value) {},
                  activeColor: MomoColors.mainBlueDark,
                  title: const Text('영어'),
                  subtitle: Text(
                    "English",
                    style: TextStyle(color: context.theme.greyColor),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.langBtnBgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => momoShowBottomSheet(context),
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
