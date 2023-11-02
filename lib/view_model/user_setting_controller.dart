import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserSettingController extends ChangeNotifier {
  UserSettingController() {
    getCurrentDate();
  }

  int currentPage = 0;
  int get getCurrentPage => currentPage;

  String startDate = "";
  String get getStartDate => startDate;

  String endDate = "";
  String get getEndDate => endDate;

  String title = "";
  String get getTitle => title;

  int backgroundImage = 0;
  int get getBackgroundImage => backgroundImage;

  int emptyImage = 0;
  int get getEmptyImage => emptyImage;

  int successStampImage = 0;
  int get getSuccessStampImage => successStampImage;

  int failStampImage = 0;
  int get getFailStampImage => failStampImage;

  int countDate = 0;
  int get getCountDate => countDate;

  bool status = false;
  bool get getStatus => status;

  void setCurrentPage(int page) {
    currentPage = page;
    notifyListeners();
  }

  void setStartDate(String date) {
    startDate = date;
    notifyListeners();
  }

  void setEndDate(String date) {
    endDate = startDate;
    notifyListeners();
  }

  void addEndDate(int addDays) {
    setEndDate(getStartDate);
    DateTime currentDate = DateFormat('yyyy. MM. dd').parse(endDate);
    DateTime newDate = currentDate.add(Duration(days: addDays));
    endDate = DateFormat('yyyy. MM. dd').format(newDate);

    notifyListeners();
  }

  void setBackgroundImage(int id) {
    backgroundImage = id;
    notifyListeners();
  }

  void setEmptyImage(int id) {
    emptyImage = id;
    notifyListeners();
  }

  void setSucessStampImage(int id) {
    successStampImage = id;
    notifyListeners();
  }

  void setFailStampImage(int id) {
    failStampImage = id;
    notifyListeners();
  }

  void setCountDate(int value) {
    countDate = value;
    notifyListeners();
  }

  void setStatus(bool value) {
    status = value;
    notifyListeners();
  }

  void getCurrentDate() {
    final now = DateTime.now();
    final currentDate = DateFormat('yyyy. MM. dd');

    setStartDate(currentDate.format(now));
    setEndDate(currentDate.format(now));
  }

  void setTitle(String titleText) {
    title = titleText;
  }
}
