import 'package:flutter/material.dart';
import 'package:souq_al_khamis_delivey_version/core/theme/app_theme.dart';
import 'package:get/get.dart';

class AppEmptyState extends StatelessWidget {
  final String message;
  final IconData icon;

  const AppEmptyState({
    super.key,
    required this.message,
    this.icon = Icons.inbox_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Icon(icon, size: 80, color: AppColor.textTertiary.withOpacity(0.5)),
          const SizedBox(height: 16),
          Text(
            message.tr,
            style: TextStyles.font16WhiteMedium.copyWith(color: AppColor.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
