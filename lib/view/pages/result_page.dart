import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_hundred_me/view/pages/widgets/header_widget.dart';
import 'package:provider/provider.dart';

import '../../statics/colors.dart';
import '../../statics/images.dart';
import '../../statics/strings.dart';
import '../../view_model/user_setting_controller.dart';

import 'dart:html' show AnchorElement;
import 'dart:ui' as ui;

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Uint8List? registrationImage;
  bool showImage = false;

  

  Future<Uint8List?> galleryImagePicker() async {
    ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );

    if (file != null)
      return await file.readAsBytes(); // convert into Uint8List.
    return null;
  }

  Widget imageArea() {
    return registrationImage != null
        ? Image.memory(
            registrationImage!,
            width: 260,
            height: 260,
          )
        : SvgPicture.asset(
            Images.imgBgGray,
          );
  }

  Widget imageButton() {
    return registrationImage != null
        ? SvgPicture.asset(
            Images.imgImageDeleteButton,
          )
        : SvgPicture.asset(
            Images.imgImageResultAddButton,
          );
  }

  void toggleImageVisibility() {
    setState(() {
      showImage = !showImage;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showImage = false;
      });
    });
  }

  Widget bottomWidget(bool status) {
    if (!status) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            toggleImageVisibility();
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24)
                .add(const EdgeInsets.only(right: 20)),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                Images.imgImageCheckButton,
                width: 80,
                height: 80,
              ),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            Images.imgNotWorking,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    int screenWidth = screenSize.width.toInt();
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          color: const Color(UserColors.grayBackGround),
          child: SizedBox(
            width: (screenWidth > 500) ? 360 : screenWidth.toDouble(),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 103),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(
                                Images.imgRectangleBlack,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      imageArea(),
                                      Positioned(
                                        right: 0,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () async {
                                              late Uint8List? image;

                                              if (registrationImage == null) {
                                                image =
                                                    await galleryImagePicker();
                                                registrationImage = image;
                                              } else {
                                                image = null;
                                                registrationImage = null;
                                              }

                                              setState(() {});
                                            },
                                            child: imageButton(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 8,
                                        child: Image.asset(
                                          Images.imgTimeStamp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          Images.imgChallengeSuccessButton,
                                        ),
                                        const SizedBox(width: 8),
                                        Image.asset(
                                          Images.imgChallengeFailButton,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Images.imgBgSmallGray,
                                      ),
                                      Positioned(
                                        left: 16,
                                        right: 16,
                                        top: 0,
                                        bottom: 0,
                                        child: TextField(
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                          decoration: const InputDecoration(
                                            hintText:
                                                Strings.strChallengeMemoHint,
                                            border: InputBorder.none,
                                            counterText: '',
                                          ),
                                          textAlign: TextAlign.left,
                                          maxLines: 5,
                                          maxLength: 45,
                                          onChanged: (text) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomWidget(showImage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
