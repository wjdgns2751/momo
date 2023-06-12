import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo/common/routes/routes.dart';
import 'package:momo/common/theme/momo_dark.dart';
import 'package:momo/common/theme/momo_light.dart';
import 'package:momo/feature/auth/controller/momo_auth_controller.dart';
import 'package:momo/feature/home/pages/momo_home_page.dart';
import 'package:momo/feature/welcome/pages/welcome_page.dart';
import 'package:momo/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(momoUserInfoAuthProvider);
    return MaterialApp(
      title: 'Momo',
      onGenerateRoute: Routes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: user.when(
        data: (user) {
          FlutterNativeSplash.remove();
          if (user == null) return const WelcomePage();
          return const MomoHomePage();
        },
        error: (error, trace) {
          return const Scaffold(
            body: Center(
              child: Text('에러발생'),
            ),
          );
        },
        loading: () => const SizedBox(),
      ),
    );
  }
}
