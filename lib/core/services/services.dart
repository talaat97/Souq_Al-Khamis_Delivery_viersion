import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_al_khamis_delivey_version/core/services/notification/notification_helper.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> intIt() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Firebase.initializeApp();
  NotificationsHelper.instance.init();

  await Get.putAsync(() => MyServices().intIt());
}
