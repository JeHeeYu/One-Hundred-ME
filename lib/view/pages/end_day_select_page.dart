import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:one_hundred_me/view/pages/widgets/header_widget.dart';
import 'package:provider/provider.dart';

import '../../data/network/network_manager.dart';
import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';
import '../../view_model/user_setting_controller.dart';

class EndDaySelectPage extends StatefulWidget {
  const EndDaySelectPage({super.key});

  @override
  _EndDaySelectPage createState() => _EndDaySelectPage();
}

class _EndDaySelectPage extends State<EndDaySelectPage> {
  int selectedIndex = -1;

  final endDayTextEditingController = TextEditingController();
  final titleTextEditingController = TextEditingController();

  NetworkManager networkManager = NetworkManager();

  String getCurrentDate() {
    final now = DateTime.now();
    final currentDate = DateFormat('yyyy. MM. dd');

    return currentDate.format(now);
  }

  String convertDateFormat(String date) {
    DateTime parsedDate = DateFormat('yyyy. MM. dd').parse(date);
    String currentDate = DateFormat('yyyy-MM-dd').format(parsedDate);

    return currentDate;
  }

  @override
  Widget build(BuildContext context) {
    UserSettingController userSettingController =
        Provider.of<UserSettingController>(context);
    Size screenSize = MediaQuery.of(context).size;
    int screenWidth = screenSize.width.toInt();

    void sendUserData() async {
      int backgroundImage = userSettingController.getBackgroundImage;
      int emptyImage = userSettingController.getEmptyImage;
      int successStampImage = userSettingController.getSuccessStampImage;
      int failStampImage = userSettingController.getFailStampImage;
      String title = userSettingController.getTitle;
      String startDate = userSettingController.getStartDate;
      String endDate = userSettingController.getEndDate;
      int countDate = userSettingController.getCountDate;

      Map<String, dynamic> userData = {
        "background_image": backgroundImage,
        "blank_image": emptyImage,
        "success_image": successStampImage,
        "failure_image": failStampImage,
        "title": title,
        "start_date": startDate,
        "end_date": endDate,
        "count_date": countDate,
        "create_date": startDate,
      };

      try {
        String serverUrl = "http://13.209.70.9/v1/challenges/";

        dynamic response = await networkManager.post(serverUrl, userData);

        print("서버 응답: $response");
      } catch (e) {
        print("오류 발생: $e");
      }
    }

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
                const SizedBox(
                  height: 12.0,
                ),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 53.0),
                        child: SvgPicture.asset(
                          Images.imgLeftBracket,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(7),
                          ],
                          controller: titleTextEditingController,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            hintText: Strings.strTitleHint,
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (text) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 53.0),
                        child: SvgPicture.asset(
                          Images.imgRightBracket,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22.0),
                Expanded(
                  child: Image.asset(
                    Images.imgBgExample,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Text(
                        '${getCurrentDate()} ~ ',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(12),
                            //FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: endDayTextEditingController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: userSettingController.getStartDate,
                            border: InputBorder.none,
                          ),
                          onChanged: (text) {
                            if (text.length == 4 || text.length == 8) {
                              endDayTextEditingController.text += '. ';
                              endDayTextEditingController.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                    offset: endDayTextEditingController
                                        .text.length),
                              );
                            }

                            if (text.isNotEmpty &&
                                (text.endsWith('.') || text.endsWith(' '))) {
                              endDayTextEditingController.text =
                                  text.substring(0, text.length - 2);
                              endDayTextEditingController.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                    offset: endDayTextEditingController
                                        .text.length),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 26.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            userSettingController.addEndDate(30);
                            endDayTextEditingController.text =
                                userSettingController.getEndDate;
                            userSettingController.setCountDate(30);
                          },
                          child: SvgPicture.asset(Images.img30DaysButton),
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            userSettingController.addEndDate(50);
                            endDayTextEditingController.text =
                                userSettingController.getEndDate;
                            userSettingController.setCountDate(50);
                          },
                          child: SvgPicture.asset(Images.img50DaysButton),
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            userSettingController.addEndDate(100);
                            endDayTextEditingController.text =
                                userSettingController.getEndDate;
                            userSettingController.setCountDate(100);
                          },
                          child: SvgPicture.asset(Images.img100DaysButton),
                        ),
                      ],
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      userSettingController
                          .setTitle(titleTextEditingController.text);
                      userSettingController
                          .setStartDate(convertDateFormat(getCurrentDate()));
                      userSettingController.setEndDate(
                          convertDateFormat(endDayTextEditingController.text));
                      userSettingController.setStatus(
                          true);

                      sendUserData();
                      Navigator.of(context).pushNamed(RoutesName.challenge);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 22.0),
                      child: SvgPicture.asset(
                          endDayTextEditingController.text.isEmpty &&
                                  titleTextEditingController.text.isEmpty
                              ? Images.imgCompleteButtonDisable
                              : Images.imgCompleteButtonEnable),
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
