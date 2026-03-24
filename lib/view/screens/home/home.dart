import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_delivey_version/core/theme/app_theme.dart';

import '../../../controller/home/bottomNavBar.dart';
import '../../widgets/custom_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavBarControllerImp());
    return GetBuilder<BottomNavBarControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: controller.listPage[controller.currentPage],
        bottomNavigationBar: const CustomButtonbar(),
      ),
    );
  }
}

