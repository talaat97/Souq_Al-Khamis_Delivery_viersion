import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../function/notification_helper.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> intIt() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  var deviseToken = await NotificationsHelper.firebaseMessaging.getToken();
  print(
      '========================================================================================');
  print("Devise Token: $deviseToken");
  print(
      '========================================================================================');

  NotificationsHelper().requestPermissionNotification();
  NotificationsHelper().configFCM();
  await Get.putAsync(() => MyServices().intIt());
}
