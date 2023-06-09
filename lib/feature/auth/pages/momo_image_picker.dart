import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:momo/common/theme/extension/momo_theme_extension.dart';
import 'package:momo/common/utils/widgets/momo_icon_button.dart';
import 'package:photo_manager/photo_manager.dart';

class MomoImagePickerPage extends StatefulWidget {
  const MomoImagePickerPage({super.key});

  @override
  State<MomoImagePickerPage> createState() => _MomoImagePickerPageState();
}

class _MomoImagePickerPageState extends State<MomoImagePickerPage> {
  List<Widget> imageList = [];
  int currentPage = 0;
  int? lastPage;

  @override
  void initState() {
    fetchAllImages();
    super.initState();
  }

  handleScrollEvenet(ScrollNotification scrollNotification) {
    //스크롤 위치가 최대 스크롤 범위의 0.33 이하인지 확인
    if (scrollNotification.metrics.pixels /
            scrollNotification.metrics.maxScrollExtent <=
        0.33) return;

    //현재 페이지가 마지막 페이지가 아닌 경우 추가 이미지
    if (currentPage == lastPage) return;
    fetchAllImages();
  }

  fetchAllImages() async {
    //앱이 기기의 사진 갤러리에 접근할 수 있는 권한을 요청
    final permission = await PhotoManager.requestPermissionExtend();

    //권한이 허용되지 않은 경우 사용자에게 권한을 수동으로 허용하도록 앱 설정
    if (!permission.isAuth) return PhotoManager.openSetting();

    //이미지에 대한 경로 목록
    List<AssetPathEntity> gallerys = await PhotoManager.getAssetPathList(
        type: RequestType.image, onlyAll: true);

    //첫 번째 갤러리에서 이미지를 나타내는 AssetEntity 객체의 페이지 목록을 가져옴
    List<AssetEntity> photos =
        await gallerys[0].getAssetListPaged(page: currentPage, size: 24);

    List<Widget> temp = [];

    for (var photo in photos) {
      temp.add(
        FutureBuilder(
          future: photo.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  onTap: () => Navigator.pop(context, snapshot.data),
                  borderRadius: BorderRadius.circular(5),
                  splashFactory: NoSplash.splashFactory,
                  child: Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: context.theme.greyColor!.withOpacity(0.4),
                              width: 1),
                          image: DecorationImage(
                              image: MemoryImage(snapshot.data as Uint8List),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5))),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      );
    }
    setState(() {
      imageList.addAll(temp);
      currentPage++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //elevation: 0,
        leading: MomoIconButton(
          onPreesed: () => Navigator.pop(context),
          icon: Icons.arrow_back,
        ),
        title: Text(
          '모모',
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        actions: [
          MomoIconButton(onPreesed: () {}, icon: Icons.more_vert),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        //스크롤 알림을 수신
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            handleScrollEvenet(notification);
            return true;
          },
          child: GridView.builder(
            itemCount: imageList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (_, index) {
              return imageList[index];
            },
          ),
        ),
      ),
    );
  }
}
