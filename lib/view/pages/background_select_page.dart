import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_hundred_me/view/pages/widgets/header_widget.dart';
import 'package:provider/provider.dart';

import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';
import '../../view_model/user_setting_controller.dart';

class BackgroundSelectPage extends StatefulWidget {
  BackgroundSelectPage({Key? key});

  @override
  State<BackgroundSelectPage> createState() => _BackgroundSelectPageState();
}

class _BackgroundSelectPageState extends State<BackgroundSelectPage> {
  List<String> backgroundImages = [
    Images.imgBackground1,
    Images.imgBackground2,
    Images.imgBackground3,
    Images.imgBackground4,
  ];

  int selectedIndex = -1;
  

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
                const HeaderWidget(
                  titleText: Strings.strBackgroundSelect,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12)
                      .add(const EdgeInsets.only(bottom: 16)),
                  child: SvgPicture.asset(
                    Images.imgTitlePaper,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                                      selectedIndex = index;
                                    });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: (index == 0) ? 45 : 0,
                              right: 25,
                            ),
                            child: Image.asset(
                              backgroundImages[index],
                              width: 270,
                              height: 480,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      // UserSettingController userSettingController =
                      //     Provider.of<UserSettingController>(context,
                      //         listen: false);
                      // userSettingController.setCurrentPage(
                      //     userSettingController.getCurrentPage + 1);

                      if(selectedIndex == -1) {
                        return;
                      }
                      
                      Navigator.of(context)
                          .pushNamed(RoutesName.emptyLayoutSelect);

                          userSettingController.setBackgroundImage(selectedIndex);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: SvgPicture.asset(
                        selectedIndex == -1
                            ? Images.imgNextButtonDisable
                            : Images.imgNextButtonEnable,
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
