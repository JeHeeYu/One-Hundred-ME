import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../statics/images.dart';
import 'dart:html' as HTML;

import '../../view_model/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController =
        Provider.of<LoginController>(context);
    Size screenSize = MediaQuery.of(context).size;
    int screenWidth = screenSize.width.toInt();
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: SizedBox(
            width: (screenWidth > 500) ? 360 : screenWidth.toDouble(),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Images.imgLoginGuideMain),
                      const SizedBox(height: 12.0),
                      SvgPicture.asset(Images.imgLoginGuideSub),
                    ],
                  ),
                ),
                SvgPicture.asset(Images.imgLoginGuideBottom),
                const SizedBox(height: 12.0),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      HTML.window.location.href = loginController.connect();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: SvgPicture.asset(
                        Images.imgKakaoLoginButton,
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
