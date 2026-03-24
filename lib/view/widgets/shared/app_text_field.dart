import 'package:flutter/material.dart';
import 'package:souq_al_khamis_delivey_version/core/theme/app_theme.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool isNumber;

  const AppTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.suffixIcon,
    required this.controller,
    required this.validator,
    this.isPassword = false,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon != null ? Icon(icon, color: AppColor.textTertiary) : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
