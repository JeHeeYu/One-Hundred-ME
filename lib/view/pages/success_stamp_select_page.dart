import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_hundred_me/view/pages/widgets/header_widget.dart';
import 'package:provider/provider.dart';

import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';
import '../../view_model/user_setting_controller.dart';

class SuccessStampSelectPage extends StatefulWidget {
  const SuccessStampSelectPage({super.key});

  @override
  _SuccessStampSelectPageState createState() => _SuccessStampSelectPageState();
}

class _SuccessStampSelectPageState extends State<SuccessStampSelectPage> {
  int selectedIndex = -1;

  List<String> stampImages = [
    Images.imgStamp1,
    Images.imgStamp2,
    Images.imgStamp3,
    Images.imgStamp4,
    Images.imgStamp5,
    Images.imgStamp6,
    Images.imgStamp7,
    Images.imgStamp8,
    Images.imgStamp9,
    Images.imgStamp10,
    Images.imgStamp11,
    Images.imgStamp12,
    Images.imgStamp13,
    Images.imgStamp14,
    Images.imgStamp15,
    Images.imgStamp16,
    Images.imgStamp17,
    Images.imgStamp18,
    Images.imgStamp19,
    Images.imgStamp20,
    Images.imgStamp21,
    Images.imgStamp22,
    Images.imgStamp23,
    Images.imgStamp24,
    Images.imgStamp25,
    Images.imgStamp26,
    Images.imgStamp27,
    Images.imgStamp28,
    Images.imgStamp29,
    Images.imgStamp30,
    Images.imgStamp31,
    Images.imgStamp32,
    Images.imgStamp33,
    Images.imgStamp34,
    Images.imgStamp35,
    Images.imgStamp36,
    Images.imgStamp37,
    Images.imgStamp38,
  ];

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
                  titleText: Strings.strSuccessStampSelect,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12)
                            .add(const EdgeInsets.only(bottom: 16)),
                        child: SvgPicture.asset(
                          Images.imgTitlePickStamp,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 5.0,
                              crossAxisSpacing: 5.0,
                            ),
                            itemCount: 38,
                            itemBuilder: (BuildContext context, int index) {
                              return MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Center(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          index == selectedIndex
                                              ? Images.imgStampClicked
                                              : Images.imgStampNormal,
                                          width: 100,
                                          height: 100,
                                        ),
                                        Image.asset(
                                          stampImages[index],
                                          width: 80,
                                          height: 80,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0)
                      .add(const EdgeInsets.only(bottom: 29.0)),
                  child: const Text(
                    Strings.strSuccessStampSelectGuide,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      if(selectedIndex == -1) {
                        return;
                      }
                
                      // UserSettingController userSettingController =
                      //     Provider.of<UserSettingController>(context,
                      //         listen: false);
                      // userSettingController.setCurrentPage(
                      //     userSettingController.getCurrentPage + 1);
                      Navigator.of(context).pushNamed(RoutesName.failStampSelect);
                      userSettingController.setSucessStampImage(selectedIndex);
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
