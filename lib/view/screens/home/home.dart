import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:souq_al_khamis_delivey_version/core/theme/app_theme.dart';

import '../../../controller/home/bottom_nav_bar.dart';
import '../../widgets/custom_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavBarControllerImp());

    return GetBuilder<BottomNavBarControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (controller.currentPage != 3)
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColor.tertiaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back 👋",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontSize: 18),
                    ),
                    Text(
                      controller.user?.name ?? 'NA',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColor.primaryColor,
                            fontSize: 24,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Ready for your next delivery 🚚",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 14,
                            height: 1.2,
                          ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: controller.listPage[controller.currentPage],
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
