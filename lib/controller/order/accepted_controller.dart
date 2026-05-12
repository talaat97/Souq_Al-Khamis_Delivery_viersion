import 'dart:convert';

import 'package:get/get.dart';
import 'package:souq_al_khamis_delivey_version/controller/order/archived_controller.dart';

import 'package:souq_al_khamis_delivey_version/data/datacorse/models/delivery_model.dart';

import '../../core/class/status_request.dart';

import '../../core/constant/routs_page.dart';
import '../../core/function/handling_data_controller.dart';

import '../../core/services/services.dart';
import '../../data/datacorse/remote/model/order_model.dart';
import '../../data/datacorse/remote/orders/OrdersData.dart';

class AcceptedController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  List<OrderModel> acceptedOrders = [];
  late String? accessToken;

  late DeliveryUser user;

  getAcceptedOrders() async {
    acceptedOrders.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await ordersData.getAcceptedOrders(user.id.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        acceptedOrders.addAll(responseData.map((e) => OrderModel.fromJson(e)));
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  archiveOrder(OrderModel orderModel) async {
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "userId": orderModel.orderUserid,
      "orderId": orderModel.orderId,
      "deliveryId": user.id.toString(),
      "userDeviceToken": orderModel.orderUserDevicetoken,
    };
    var response = await ordersData.orderDone(data);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        await getAcceptedOrders();
        await refreshOrderArchived();
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
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
    getAcceptedOrders();
    super.onInit();
  }

  getUser() {
    final userString = myServices.sharedPreferences.getString('deliveryUser');
    Map<String, dynamic> deliveryUser = jsonDecode(userString!);
    user = DeliveryUser.fromJson(deliveryUser);
  }

  refreshOrderArchived() async {
    ArchivedController archivedController = Get.put(ArchivedController());
    await archivedController.getArchivedOrders();
  }
}
