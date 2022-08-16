import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happydonuts/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  static final AppServices _singleton = AppServices._internal();
  late SharedPreferences sharedPreferences;
  late bool isDarkMode;
  late FirebaseStorage firebaseStorage;

  factory AppServices() => _singleton;
  AppServices._internal();

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isDarkMode =
        sharedPreferences.getBool(AppSharedPrefs.isDarkMode) ?? Get.isDarkMode;
    firebaseStorage = FirebaseStorage.instance;
    return this;
  }

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    sharedPreferences.setBool(AppSharedPrefs.isDarkMode, isDarkMode);
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}

initAppServices() async {
  await Get.putAsync(() => AppServices().init());
}
