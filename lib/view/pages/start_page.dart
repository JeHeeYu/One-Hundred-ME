import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../view_model/user_setting_controller.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    int screenWidth = screenSize.width.toInt();
    UserSettingController userSettingController =
        Provider.of<UserSettingController>(context);
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
                  Padding(
                    padding: const EdgeInsets.only(top: 12)
                        .add(const EdgeInsets.only(bottom: 16)),
                    child: SvgPicture.asset(
                      Images.imgTitleChallenge,
                    ),
                  ),
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
                        Navigator.of(context)
                            .pushNamed(RoutesName.backgroundSelect);
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
