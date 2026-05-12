import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_delivey_version/core/class/handling_data.dart';
import 'package:souq_al_khamis_delivey_version/core/function/order_functions.dart';
import '../../../controller/order/pending_controller.dart';
import '../../widgets/order/pending_theme_card.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingController());

    return GetBuilder<PendingController>(
      builder: (pageController) => RefreshIndicator(
        onRefresh: () async {
          await pageController.getPendingOrders();
        },
        child: HandlingDataView(
          statusRequest: pageController.statusRequest,
          widget: ListView.builder(
            itemCount: pageController.ordersPending.length,
            itemBuilder: (context, index) => PendingThemeCard(
              statusRequest: pageController.statusRequest,
              color:
                  colorCard(pageController.ordersPending[index].orderStatus!),
              orderModel: pageController.ordersPending[index],
              orderApprove: () {
                pageController
                    .orderApprove(pageController.ordersPending[index]);
              },
              goToOrderDetails: () {
                pageController
                    .goToOrderDetails(pageController.ordersPending[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
