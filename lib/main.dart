import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:one_hundred_me/routes/routes.dart';
import 'package:one_hundred_me/routes/routes_name.dart';
import 'package:one_hundred_me/utils/oauth/kakao_oauth.dart';
import 'package:one_hundred_me/view_model/login/login_controller.dart';
import 'package:one_hundred_me/view_model/user_setting_controller.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(javaScriptAppKey: KakaoOauth.javaScriptKey);
  setPathUrlStrategy();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => LoginController()),
      ChangeNotifierProvider(create: (_) => UserSettingController()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '100ME',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
      scrollBehavior: AppScrollBehavior(),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
