import 'package:flutter/material.dart';

import '../../utils/oauth/kakao_oauth.dart';

class LoginController extends ChangeNotifier{
  final key = KakaoOauth.javaScriptKey;
  final redirectUri = KakaoOauth.redirecUri;
  bool loginStatus = false;

  String connect() => 'http://13.209.70.9/accounts/kakao/login/';
  //"https://kauth.kakao.com/oauth/authorize?client_id=$key&redirect_uri=$redirectUri&response_type=code";

  void login() {
    loginStatus = true;
    notifyListeners();
  }
}