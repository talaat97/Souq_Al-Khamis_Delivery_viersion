import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_delivey_version/controller/auth/login_controller.dart';
import 'package:souq_al_khamis_delivey_version/core/theme/app_theme.dart';
import 'package:souq_al_khamis_delivey_version/core/function/alert.dart';
import 'package:souq_al_khamis_delivey_version/core/function/valild.dart';
import 'package:souq_al_khamis_delivey_version/view/widgets/shared/app_button.dart';
import 'package:souq_al_khamis_delivey_version/view/widgets/shared/app_text_field.dart';
import 'package:souq_al_khamis_delivey_version/view/widgets/shared/app_card.dart';
import 'package:souq_al_khamis_delivey_version/view/widgets/auth/logo_auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LogeinControllerImp controller = Get.put(LogeinControllerImp());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Sign In',
          style: TextStyles.font24BlackBold,
        ),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: exitAlert,
        child: AppBackground(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Form(
                key: controller.formkey,
                child: AppCard(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const LogoAuth(),
                      const SizedBox(height: 16),
                      Text(
                        '10'.tr, // Welcome Text
                        style: TextStyles.font24BlackBold,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '11'.tr, // Subtitle Text
                        style: TextStyles.font14GrayRegular,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      AppTextField(
                        hintText: '12'.tr,
                        icon: Icons.email_outlined,
                        controller: controller.email,
                        validator: (val) {
                          return checkVaild(val!, 5, 100, 'email');
                        },
                      ),
                      const SizedBox(height: 20),
                      GetBuilder<LogeinControllerImp>(
                        builder: (controller) => AppTextField(
                          hintText: '13'.tr,
                          icon: Icons.lock_outline,
                          isPassword: controller.isShowPassword,
                          controller: controller.password,
                          validator: (val) {
                            return checkVaild(val!, 3, 30, 'password');
                          },
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isShowPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColor.textTertiary,
                            ),
                            onPressed: () {
                              controller.showPassword();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      GetBuilder<LogeinControllerImp>(
                        builder: (controller) => AppButton(
                          text: '15'.tr, // Login
                          onPressed: () {
                            controller.login();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
