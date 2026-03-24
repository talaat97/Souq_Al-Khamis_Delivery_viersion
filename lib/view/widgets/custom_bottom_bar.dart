import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/bottomNavBar.dart';
import '../../core/theme/app_theme.dart';

class CustomButtonbar extends GetView {
  const CustomButtonbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarControllerImp>(
      builder: (pageController) => BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        color: AppColor.cardBackground,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              pageController.listPage.length,
              (index) => OneButtonAppBar(
                pageName: pageController.titlePage[index]['title'],
                pageIcon: pageController.titlePage[index]['icon'],
                onPressed: () {
                  pageController.changePage(index);
                },
                active: pageController.currentPage == index ? true : false,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OneButtonAppBar extends StatelessWidget {
  final String pageName;
  final IconData pageIcon;
  bool? active;
  final void Function() onPressed;
  OneButtonAppBar({
    super.key,
    required this.pageName,
    required this.pageIcon,
    required this.onPressed,
    this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(pageIcon,
                size: active == true ? 28 : 24,
                color: active == true ? AppColor.primaryColor : AppColor.textTertiary),
            const SizedBox(height: 4),
            Text(
              pageName,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: active == true ? FontWeight.bold : FontWeight.normal,
                  color: active == true ? AppColor.primaryColor : AppColor.textTertiary),
            ),
          ],
        ),
      ),
    );
  }
}

