import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../statics/colors.dart';
import '../../../view_model/user_setting_controller.dart';

class HeaderWidget extends StatelessWidget {
  final double height;
  final String titleText;

  const HeaderWidget({Key? key, this.height = 56, required this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: const Color(UserColors.mainBackGround),
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                // UserSettingController userSettingController = Provider.of<UserSettingController>(context, listen: false);
                // userSettingController.setCurrentPage(userSettingController.getCurrentPage - 1);
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
            child: Padding(
              padding: const EdgeInsets.only(right: 44),
              child: Text(
                titleText,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
