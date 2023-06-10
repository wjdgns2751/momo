import 'package:flutter/material.dart';
import 'package:momo/feature/auth/pages/momo_login_page.dart';
import 'package:momo/feature/auth/pages/momo_user_info_page.dart';
import 'package:momo/feature/auth/pages/momo_vertification_page.dart';
import 'package:momo/feature/home/pages/momo_home_page.dart';
import 'package:momo/feature/welcome/pages/welcome_page.dart';

class Routes {
  static const String welcomePage = 'welcome';
  static const String loginPage = 'login';
  static const String uesrInfoPage = 'userInfo';
  static const String verificationPage = 'verification';
  static const String homePage = 'home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(builder: (context) => const WelcomePage());

      case loginPage:
        return MaterialPageRoute(builder: (context) => const MomoLoginPage());

      case uesrInfoPage:
        return MaterialPageRoute(
            builder: (context) => const MomoUserInfoPage());

      case verificationPage:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => MomoVerificationPage(
                  smsCodeId: args['verificationId'],
                  phoneNumber: args['phoneNumber'],
                ));

      case homePage:
        return MaterialPageRoute(builder: (context) => const MomoHomePage());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('제공되지 않는 경로입니다.'),
            ),
          ),
        );
    }
  }
}
