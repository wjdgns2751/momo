import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:momo/common/routes/routes.dart';
import 'package:momo/common/theme/momo_dark.dart';
import 'package:momo/common/theme/momo_light.dart';
import 'package:momo/feature/auth/pages/momo_user_info_page.dart';
import 'package:momo/feature/welcome/pages/welcome_page.dart';
import 'package:momo/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Momo',
      onGenerateRoute: Routes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const WelcomePage(),
    );
  }
}
