import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes/routes_name.dart';
import '../../statics/images.dart';
import '../../view_model/user_setting_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 3)).then((_) async {
      Navigator.of(context).pushNamed(RoutesName.start);
    });

    return const Image(
      image: AssetImage(Images.bgSplash),
      fit: BoxFit.contain,
    );
  }
}
