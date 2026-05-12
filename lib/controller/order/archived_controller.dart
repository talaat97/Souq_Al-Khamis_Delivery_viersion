import 'dart:convert';

import 'package:get/get.dart';
import 'package:souq_al_khamis_delivey_version/data/datacorse/models/delivery_model.dart';

import '../../core/class/status_request.dart';

import '../../core/constant/routs_page.dart';
import '../../core/function/handling_data_controller.dart';

import '../../core/services/services.dart';
import '../../data/datacorse/remote/model/order_model.dart';
import '../../data/datacorse/remote/orders/OrdersData.dart';

class ArchivedController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  List<OrderModel> archivedOrders = [];
  late DeliveryUser user;

  getArchivedOrders() async {
    archivedOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    final userString = myServices.sharedPreferences.getString('deliveryUser');
    Map<String, dynamic> deliveryUser = jsonDecode(userString!);
    DeliveryUser user = DeliveryUser.fromJson(deliveryUser);

    var response = await ordersData.getArchiveOrders(
      user.id.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];

        archivedOrders.addAll(responseData.map((e) => OrderModel.fromJson(e)));
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  goToOrderDetails(OrderModel orderModel) {
    Get.toNamed(AppRoute.orderDetails, arguments: {
      'orderModel': orderModel,
    });
  }

  @override
  void onInit() {
    getUser();
    getArchivedOrders();
    super.onInit();
  }

  getUser() {
    final userString = myServices.sharedPreferences.getString('deliveryUser');
    Map<String, dynamic> deliveryUser = jsonDecode(userString!);
    user = DeliveryUser.fromJson(deliveryUser);
  }
}
