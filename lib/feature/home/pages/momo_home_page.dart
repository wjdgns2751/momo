import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo/common/utils/widgets/momo_icon_button.dart';
import 'package:momo/feature/home/pages/momo_call_page.dart';
import 'package:momo/feature/home/pages/momo_chat_page.dart';
import 'package:momo/feature/home/pages/momo_status_page.dart';

class MomoHomePage extends ConsumerStatefulWidget {
  const MomoHomePage({super.key});

  @override
  ConsumerState<MomoHomePage> createState() => _MomoHomePageState();
}

class _MomoHomePageState extends ConsumerState<MomoHomePage> {
  late Timer timer;

  // updateUserPresence() {
  //   ref.read(momoAuthControllerProvider.updateUserPresence();
  // }

  @override
  void initState() {
    // updateUserPresence();
    timer = Timer.periodic(
      const Duration(minutes: 1),
      (timer) => setState(() {}),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '모모',
            style: TextStyle(letterSpacing: 1),
          ),
          elevation: 1,
          actions: [
            MomoIconButton(onPressed: () {}, icon: Icons.search),
            MomoIconButton(onPressed: () {}, icon: Icons.more_vert),
          ],
          bottom: const TabBar(
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(text: '메시지'),
              Tab(text: '상태'),
              Tab(text: '연락'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MomoChatPage(),
            MomoStatusPage(),
            MomoCallPage(),
            // StatusHomePage(),
            // CallHomePage(),
          ],
        ),
      ),
    );
  }
}
