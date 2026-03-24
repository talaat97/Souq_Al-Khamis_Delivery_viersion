import 'package:flutter/material.dart';
import 'package:souq_al_khamis_delivey_version/core/theme/app_theme.dart';

class AppBadge extends StatelessWidget {
  final String text;
  final Color color;

  const AppBadge({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color, 
          fontSize: 12,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
    );
  }
}
