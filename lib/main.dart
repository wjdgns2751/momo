import 'package:flutter/material.dart';
import 'package:momo_messagner/common/theme/momo_dark.dart';
import 'package:momo_messagner/common/theme/momo_light.dart';
import 'package:momo_messagner/feature/auth/pages/momo_login_page.dart';
import 'package:momo_messagner/feature/welcome/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoMo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const MomoLoginPage(),
    );
  }
}
