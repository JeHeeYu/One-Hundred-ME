import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../view_model/login/login_controller.dart';
import '../../view_model/user_setting_controller.dart';

import 'dart:html' as HTML;

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserSettingController userSettingController =
        Provider.of<UserSettingController>(context);
    Size screenSize = MediaQuery.of(context).size;
    int screenWidth = screenSize.width.toInt();
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          color: const Color(UserColors.mainBackGround),
          child: SizedBox(
            width: (screenWidth > 500) ? 360 : screenWidth.toDouble(),
            child: Column(
              children: [
                SvgPicture.asset(
                  Images.img100MELogo,
                ),
                const SizedBox(height: 12),
                Text(
                  "[ ${userSettingController.getTitle} ]",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 19),
                Expanded(
                  child: Image.asset(
                    Images.imgBgExample,
                  ),
                ),
                const SizedBox(height: 55),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      //Navigator.of(context).pushNamed(RoutesName.home);
                      //HTML.window.location.href = loginController.connect();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: SvgPicture.asset(
                        Images.imgCreateChallengeButtonEnable,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
