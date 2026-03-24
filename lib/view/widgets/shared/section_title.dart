import 'package:flutter/material.dart';
import 'package:souq_al_khamis_delivey_version/core/theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyles.font18DarkBlueBold,
      ),
    );
  }
}
