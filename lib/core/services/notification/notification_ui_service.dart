import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_delivey_version/core/constant/colors.dart';

class NotificationUIService {
  static void showBanner({
    required String title,
    required String body,
    Duration duration = const Duration(seconds: 5),
  }) {
    final context = Get.key.currentContext;

    if (context == null) return; // 🛑 prevent crash

    final messenger = ScaffoldMessenger.of(context);

    // Remove current banner if exists (avoid stacking)
    messenger.hideCurrentMaterialBanner();

    messenger.showMaterialBanner(
      MaterialBanner(
        backgroundColor: AppColor.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔵 Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications,
                color: AppColor.primaryColor,
                size: 22,
              ),
            ),

            const SizedBox(width: 12),

            // 📝 Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    body,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColor.grey,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),

        actions: [
          TextButton(
            onPressed: () => messenger.hideCurrentMaterialBanner(),
            child: Text(
              "DISMISS",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

    // ⏱ Auto dismiss
    Future.delayed(duration, () {
      messenger.hideCurrentMaterialBanner();
    });
  }
}