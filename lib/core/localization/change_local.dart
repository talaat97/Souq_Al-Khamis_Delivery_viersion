import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_delivey_version/core/theme/app_theme.dart';
import 'package:souq_al_khamis_delivey_version/core/services/services.dart';
import 'package:souq_al_khamis_delivey_version/controller/home/bottom_nav_bar.dart';

class LocaleController extends GetxController {
  Locale? language;
  ThemeData appTheme = AppTheme.themeEnglish;
  MyServices myServices = Get.find();

  chnageLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == 'ar' ? AppTheme.themeArabic : AppTheme.themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
    
    // Update the bottom navigation bar to reflect the new language instantly
    if (Get.isRegistered<BottomNavBarControllerImp>()) {
      Get.find<BottomNavBarControllerImp>().update();
    }
  }

  @override
  void onInit() {
    requstPerLocation();
    String? langOfRefrence = myServices.sharedPreferences.getString("lang");
    if (langOfRefrence == 'ar') {
      language = const Locale('ar');
      appTheme = AppTheme.themeArabic;
    } else if (langOfRefrence == 'en') {
      language = const Locale('en');
      appTheme = AppTheme.themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = language!.languageCode == 'ar' ? AppTheme.themeArabic : AppTheme.themeEnglish;
    }

    super.onInit();
  }

  requstPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar('OPPS!', 'You need to enable location service..');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar('OPPS!', 'You need to enable location in apps ');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar('Ok Asshole !!!', 'You cant open the application');
    }
  }
}
