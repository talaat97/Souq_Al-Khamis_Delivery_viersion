import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_delivey_version/data/datacorse/models/delivery_model.dart';
import 'package:souq_al_khamis_delivey_version/core/services/services.dart';

import 'package:souq_al_khamis_delivey_version/view/screens/order/accepted.dart';
import 'package:souq_al_khamis_delivey_version/view/screens/order/archive.dart';
import 'package:souq_al_khamis_delivey_version/view/screens/order/pending.dart';

import 'package:souq_al_khamis_delivey_version/view/screens/setting/setting_page.dart';

abstract class BottomNavBarController extends GetxController {
  changePage(int i);
}

class BottomNavBarControllerImp extends BottomNavBarController {
  MyServices myServices = Get.find();

  DeliveryUser? user;
  int currentPage = 0;
  List<Widget> listPage = const [
    PendingOrders(),
    AcceptedOrders(),
    ArchiveOrders(),
    SettingPage(),
  ];
  List get titlePage => [
        {
          "title": '45'.tr,
          "icon": Icons.pending_actions_rounded,
        },
        {
          "title": '46'.tr,
          "icon": Icons.task_alt_sharp,
        },
        {
          "title": '47'.tr,
          "icon": Icons.archive_outlined,
        },
        {
          "title": '48'.tr,
          "icon": Icons.settings,
        },
      ];

  @override
  void onInit() {
    final data = myServices.sharedPreferences.getString('deliveryUser');
    if (data != null) {
      user = DeliveryUser.fromJson(jsonDecode(data));
    }
    super.onInit();
  }

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
