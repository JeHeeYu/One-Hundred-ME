import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_hundred_me/view/pages/widgets/header_widget.dart';
import 'package:provider/provider.dart';

import '../../routes/routes_name.dart';
import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';
import '../../view_model/user_setting_controller.dart';

import 'dart:html' show AnchorElement;
import 'dart:ui' as ui;

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  GlobalKey screenshotKey = GlobalKey();

  Future<void> downloadScreenshotFn() async {
    final BuildContext? currentContext = screenshotKey.currentContext;
    if (currentContext == null) {
      return;
    }

    final RenderRepaintBoundary? boundary =
        currentContext.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      //Widgets.showToast('Unable to share! Please take a screenshot');
      return;
    }
    final ui.Image image = await boundary.toImage(pixelRatio: 2);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();
    try {
      AnchorElement()
        ..href = Uri.dataFromBytes(pngBytes, mimeType: 'image/png').toString()
        ..download = 'Photo.png'
        ..style.display = 'none'
        ..click();
    } catch (e) {
      print('error while Downloading: $e');
    }
  }

  Widget titleWidget(int index) {
    switch (index) {
      case 1:
        return SvgPicture.asset(Images.imgEmptyTitle2);
      case 2:
        return SvgPicture.asset(Images.imgEmptyTitle3);
      case 3:
        return SvgPicture.asset(Images.imgEmptyTitle4);

      case 0:
      default:
        return SvgPicture.asset(Images.imgEmptyTitle1);
    }
  }

  Widget emptyWidget(int index) {
    switch (index) {
      case 0:
        return SvgPicture.asset(Images.imgPoint1, width: 35, height: 35);
      case 1:
        return SvgPicture.asset(Images.imgPoint2, width: 35, height: 35);
      case 2:
        return SvgPicture.asset(Images.imgPoint3, width: 35, height: 35);
      case 3:
        return SvgPicture.asset(Images.imgPoint4, width: 35, height: 35);

      default:
        return SvgPicture.asset(Images.imgPoint1, width: 35, height: 35);
    }
  }

  Widget dayWidget(int index) {
    switch (index) {
      case 59:
        return Image.asset(Images.imgStamp11, width: 35, height: 35);
      case 29:
        return Image.asset(Images.imgStamp7, width: 35, height: 35);
      case 99:
        return Image.asset(Images.imgStamp15, width: 35, height: 35);

      default:
        return SvgPicture.asset(Images.imgPoint1, width: 35, height: 35);
    }
  }

  Widget stampWidget({int stampStatus = 0, int stampIndex = 0}) {
    if (stampStatus == 1) {
      return Image.asset(stampImages[stampIndex], width: 35, height: 35);
    } else if (stampStatus == 2) {
      return Image.asset(stampImages[stampIndex], width: 35, height: 35);
    }

    return Image.asset(stampImages[stampIndex], width: 35, height: 35);
  }

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

  List<String> backgroundImages = [
    Images.imgBackground1,
    Images.imgBackground2,
    Images.imgBackground3,
    Images.imgBackground4,
  ];

  List<String> emptyImages = [
    Images.imgEmpty1,
    Images.imgEmpty2,
    Images.imgEmpty3,
    Images.imgEmpty4,
  ];

  @override
  Widget build(BuildContext context) {
    UserSettingController userSettingController =
        Provider.of<UserSettingController>(context);
    Size screenSize = MediaQuery.of(context).size;
    int screenWidth = screenSize.width.toInt();

    int backgroundImage = userSettingController.getBackgroundImage;
    int emptyImage = userSettingController.getEmptyImage;
    int successStampImage = userSettingController.getSuccessStampImage;
    int failStampImage = userSettingController.getFailStampImage;
    String title = userSettingController.getTitle;
    String startDate = userSettingController.getStartDate;
    String endDate = userSettingController.getEndDate;
    int countDate = userSettingController.getCountDate;

    final titleIndex = 1;
    return RepaintBoundary(
      key: screenshotKey,
      child: Scaffold(
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: SizedBox(
              width: (screenWidth > 500) ? 360 : screenWidth.toDouble(),
              child: Column(
                children: [
                  Container(
                    height: 56,
                    child: Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () async {
                              //Navigator.of(context).pushNamed(RoutesName.result);
                              await downloadScreenshotFn();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Icon(
                                Icons.file_download,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      titleWidget(backgroundImage),
                      Center(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32, right: 32),
                      child: Stack(
                        children: [
                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              childAspectRatio: 1.2,
                            ),
                            itemCount: 100,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0 ||
                                  index == 1 ||
                                  index == 2 ||
                                  index == 6 ||
                                  index == 7 ||
                                  index == 8) {
                                return Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: stampWidget(
                                      stampStatus: 1,
                                      stampIndex: successStampImage),
                                );
                              }
                              if (index == 3 ||
                                  index == 4 ||
                                  index == 5 ||
                                  index == 9) {
                                return Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: stampWidget(
                                      stampStatus: 1, stampIndex: failStampImage),
                                );
                              } else if (index == 29 ||
                                  index == 59 ||
                                  index == 99) {
                                return Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: dayWidget(index),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: emptyWidget(emptyImage),
                                );
                              }
                            },
                          ),
                          Positioned(
                            right: 0,
                            bottom: 91,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(RoutesName.result);
                                },
                                child: Image.asset(
                                  Images.imgImageAddButton,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
