import 'package:flutter/material.dart';
import 'package:one_hundred_me/routes/routes_name.dart';
import 'package:one_hundred_me/view/pages/background_select_page.dart';
import 'package:one_hundred_me/view/pages/empty_layout_select_page.dart';
import 'package:one_hundred_me/view/pages/end_day_select_page.dart';
import 'package:one_hundred_me/view/pages/fail_stamp_select_page.dart';
import 'package:one_hundred_me/view/pages/result_page.dart';
import 'package:one_hundred_me/view/pages/success_stamp_select_page.dart';

import '../view/pages/challenge_page.dart';
import '../view/pages/home_page.dart';
import '../view/pages/login_page.dart';
import '../view/pages/splash_page.dart';
import '../view/pages/start_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashPage());
      case RoutesName.start:
        return MaterialPageRoute(
            builder: (BuildContext context) => const StartPage());
      case RoutesName.backgroundSelect:
        return MaterialPageRoute(
            builder: (BuildContext context) => BackgroundSelectPage());
      case RoutesName.emptyLayoutSelect:
        return MaterialPageRoute(
            builder: (BuildContext context) => EmptyLayoutSelectPage());
      case RoutesName.successStampSelect:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SuccessStampSelectPage());
      case RoutesName.failStampSelect:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FailStampSelectPage());
      case RoutesName.endDaySelect:
        return MaterialPageRoute(
            builder: (BuildContext context) => const EndDaySelectPage());
      case RoutesName.result:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ResultPage());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage());
      case RoutesName.challenge:
      case RoutesName.challengeSharp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChallengePage());
      case RoutesName.home:
      default:
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
    }
  }
}
