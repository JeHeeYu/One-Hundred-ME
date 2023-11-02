import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:one_hundred_me/view/pages/background_select_page.dart';
import 'package:one_hundred_me/view/pages/result_page.dart';
import 'package:one_hundred_me/view/pages/start_page.dart';
import 'package:one_hundred_me/view/pages/success_stamp_select_page.dart';
import 'package:one_hundred_me/view_model/user_setting_controller.dart';
import 'package:provider/provider.dart';
import 'dart:html' as HTML;

import '../../view_model/login/login_controller.dart';
import '../../view_model/user_setting_controller.dart';
import 'create_page.dart';
import 'empty_layout_select_page.dart';
import 'end_day_select_page.dart';
import 'fail_stamp_select_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    UserSettingController userSettingController =
        Provider.of<UserSettingController>(context, listen: false);

    userSettingController.addListener(() {
      pageController.animateToPage(
        userSettingController.getCurrentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Provider.of<LoginController>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (int page) {
              UserSettingController userSettingController =
                  Provider.of<UserSettingController>(context, listen: false);
              userSettingController.setCurrentPage(page);
            },
            children: [
              BackgroundSelectPage(),
              EmptyLayoutSelectPage(),
              SuccessStampSelectPage(),
              FailStampSelectPage(),
              EndDaySelectPage(),
              CreatePage(),
              ResultPage(),
            ],
          ),
        ),
      ],
    );
  }
}
