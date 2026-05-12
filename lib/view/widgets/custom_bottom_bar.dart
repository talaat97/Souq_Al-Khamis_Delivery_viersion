import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/bottom_nav_bar.dart';
import '../../core/theme/app_theme.dart';

class BottomNavBar extends GetView<BottomNavBarControllerImp> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GetBuilder<BottomNavBarControllerImp>(
      builder: (controller) => BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        color: AppColor.cardBackground,
        elevation: 10,
        child: Row(
          children: List.generate(
            controller.listPage.length,
            (index) => Expanded(
              child: OneButtonAppBar(
                pageName: controller.titlePage[index]['title'],
                pageIcon: controller.titlePage[index]['icon'],
                active: controller.currentPage == index,
                onPressed: () {
                  controller.changePage(index);
                },
                width: width,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OneButtonAppBar extends StatelessWidget {
  final String pageName;
  final IconData pageIcon;
  final bool active;
  final VoidCallback onPressed;
  final double width;

  const OneButtonAppBar({
    super.key,
    required this.pageName,
    required this.pageIcon,
    required this.onPressed,
    required this.active,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive sizes
    final iconSize = width * 0.06; // adjust automatically
    final fontSize = width * 0.028;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              pageIcon,
              size: active ? iconSize + 2 : iconSize,
              color: active ? AppColor.primaryColor : AppColor.textTertiary,
            ),
            const SizedBox(height: 4),
            FittedBox(
              child: Text(
                pageName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: active ? FontWeight.bold : FontWeight.normal,
                  color: active ? AppColor.primaryColor : AppColor.textTertiary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
