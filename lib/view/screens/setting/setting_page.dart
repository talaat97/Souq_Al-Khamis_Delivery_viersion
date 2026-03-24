import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_delivey_version/core/theme/app_theme.dart';
import 'package:souq_al_khamis_delivey_version/core/constant/image_assets.dart';
import 'package:souq_al_khamis_delivey_version/view/widgets/shared/app_card.dart';

import '../../../controller/settings/settings_contoller.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsContoller());
    return AppBackground(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          const SizedBox(height: 60),
          Center(
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColor.cardBackground,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: AppColor.primaryColor.withOpacity(0.15), blurRadius: 20, spreadRadius: 5),
                ],
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: AppColor.surfaceColor,
                backgroundImage: AssetImage(AppImageAsset.deliveryLogo),
              ),
            ),
          ),
          const SizedBox(height: 32),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                GetBuilder<SettingsContoller>(
                  builder: (controller) => SwitchListTile(
                    title: Text('50'.tr, style: TextStyles.font16WhiteSemiBold.copyWith(color: AppColor.textPrimary)),
                    activeColor: AppColor.primaryColor,
                    value: controller.notifactionSwitch,
                    secondary: const Icon(Icons.notifications_active_outlined, color: AppColor.textSecondary),
                    onChanged: (value) {
                      controller.notifactionSwitch = value;
                      controller.diableNotification();
                    },
                  ),
                ),
                const Divider(height: 1, color: AppColor.neutralLight),
                TextInCardSeetting(
                    title: '53'.tr,
                    onTap: () {
                      controller.phoneCall();
                    },
                    icon: Icons.support_agent_outlined),
                const Divider(height: 1, color: AppColor.neutralLight),
                TextInCardSeetting(
                    title: '55'.tr,
                    onTap: () {
                      controller.changeLang();
                    },
                    icon: Icons.language_outlined),
                const Divider(height: 1, color: AppColor.neutralLight),
                TextInCardSeetting(
                    title: '54'.tr,
                    onTap: () {
                      controller.logOut();
                    },
                    icon: Icons.logout_outlined,
                    isDestructive: true),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextInCardSeetting extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final IconData icon;
  final bool isDestructive;
  
  const TextInCardSeetting({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyles.font16WhiteSemiBold.copyWith(
          color: isDestructive ? AppColor.errorColor : AppColor.textPrimary
        ),
      ),
      onTap: onTap,
      leading: Icon(
        icon,
        color: isDestructive ? AppColor.errorColor : AppColor.textSecondary,
        size: 24,
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColor.textTertiary),
    );
  }
}
