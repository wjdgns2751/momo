import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momo/common/helper/momo_alert_dialog.dart';
import 'package:momo/common/theme/extension/momo_theme_extension.dart';
import 'package:momo/common/utils/momo_colors.dart';
import 'package:momo/common/utils/widgets/momo_elevated_button.dart';
import 'package:momo/common/utils/widgets/momo_icon_button.dart';
import 'package:momo/common/utils/widgets/momo_short_bar.dart';
import 'package:momo/feature/auth/controller/momo_auth_controller.dart';
import 'package:momo/feature/auth/pages/momo_image_picker.dart';
import 'package:momo/feature/auth/widgets/momo_text_field.dart';

class MomoUserInfoPage extends ConsumerStatefulWidget {
  const MomoUserInfoPage({super.key, this.profileImageUrl});

  final String? profileImageUrl;

  @override
  ConsumerState<MomoUserInfoPage> createState() => _MomoUserInfoPageState();
}

class _MomoUserInfoPageState extends ConsumerState<MomoUserInfoPage> {
  File? imageCamera;
  Uint8List? imageGallery;

  late TextEditingController userNameController;

  saveUserDataToFirebase() {
    String userName = userNameController.text;
    if (userName.isEmpty) {
      return showAlertDialog(context: context, message: "이름이 없습니다.");
    } else if (userName.length < 3 || userName.length > 20) {
      return showAlertDialog(
          context: context, message: "이름은 3글자 이상 10글자 이내로 작성해주세요.");
    }

    ref.read(momoAuthControllerProvider).saveUserInfoToFireStore(
          userName: userName,
          profileImage: imageCamera ??
              imageGallery ??
              widget.profileImageUrl ??
              widget.profileImageUrl ??
              '',
          context: context,
          mounted: mounted,
        );
  }

  momoImagePickerTypeBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MomoShortBar(),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  '사진 정보',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                MomoIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icons.close,
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            Divider(
              color: context.theme.greyColor!.withOpacity(0.3),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                imagePickerIcon(
                    onTap: pickmageFromCamera,
                    icon: Icons.camera_alt_outlined,
                    text: '카메라'),
                const SizedBox(
                  width: 15,
                ),
                imagePickerIcon(
                    onTap: () async {
                      Navigator.pop(context);
                      final image = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MomoImagePickerPage(),
                          ));
                      if (image == null) return;
                      setState(() {
                        imageGallery = image;
                        imageCamera = null;
                      });
                    },
                    icon: Icons.photo_camera_back_outlined,
                    text: '사진'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }

  pickmageFromCamera() async {
    try {
      Navigator.pop(context);
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        imageCamera = File(image!.path);
        imageGallery = null;
      });
    } catch (e) {
      showAlertDialog(context: context, message: e.toString());
    }
  }

  imagePickerIcon({
    required VoidCallback onTap,
    required IconData icon,
    required String text,
  }) {
    return Column(
      children: [
        MomoIconButton(
          onPressed: onTap,
          icon: icon,
          iconColor: MomoColors.mainBlueDark,
          minWidth: 50,
          border: Border.all(
              color: context.theme.greyColor!.withOpacity(0.2), width: 1),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(color: context.theme.greyColor),
        )
      ],
    );
  }

  @override
  void initState() {
    userNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

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
          GestureDetector(
            onTap: momoImagePickerTypeBottomSheet,
            child: Container(
                padding: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.theme.photoIconBgColor,
                  border: Border.all(
                    color: imageCamera == null && imageGallery == null
                        ? Colors.transparent
                        : context.theme.greyColor!.withOpacity(0.4),
                  ),
                  image: imageCamera != null ||
                          imageGallery != null ||
                          widget.profileImageUrl != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: imageGallery != null
                              ? MemoryImage(imageGallery!)
                              : widget.profileImageUrl != null
                                  ? NetworkImage(widget.profileImageUrl!)
                                  : FileImage(imageCamera!) as ImageProvider,
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3, right: 3),
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    size: 48,
                    color: imageCamera == null &&
                            imageGallery == null &&
                            widget.profileImageUrl == null
                        ? context.theme.photoIconColor
                        : Colors.transparent,
                  ),
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: MomoTextField(
                  textEditingController: userNameController,
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
        onPressed: saveUserDataToFirebase,
        text: '다음으로',
        buttonWidth: 88,
      ),
    );
  }
}
