import 'dart:convert';

import 'package:get/get.dart';
import 'package:souq_al_khamis_delivey_version/controller/order/accepted_controller.dart';
import 'package:souq_al_khamis_delivey_version/controller/order/track_location_contoller.dart';
import 'package:souq_al_khamis_delivey_version/data/datacorse/models/delivery_model.dart';

import '../../core/class/status_request.dart';

import '../../core/constant/routs_page.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datacorse/remote/model/order_model.dart';
import '../../data/datacorse/remote/orders/OrdersData.dart';

class PendingController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  List<OrderModel> ordersPending = [];

  dynamic accessToken;

  getPendingOrders() async {
    ordersPending.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await ordersData.getPendingOrders();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        ordersPending.addAll(responseData.map((e) => OrderModel.fromJson(e)));
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  void goToOrderDetails(OrderModel orderModel) {
    Get.toNamed(AppRoute.orderDetails, arguments: {
      'orderModel': orderModel,
    });
  }

  orderApprove(OrderModel orderModel) async {
    statusRequest = StatusRequest.loading;
    update();

    final userString = myServices.sharedPreferences.getString('deliveryUser');
    Map<String, dynamic> deliveryUser = jsonDecode(userString!);
    DeliveryUser user = DeliveryUser.fromJson(deliveryUser);

    Map data = {
      "deliveryId": user.id.toString(),
      "deliveryName": user.name.toString(),
      "userId": orderModel.orderUserid,
      "orderId": orderModel.orderId,
      "userDeviceToken": orderModel.orderUserDevicetoken,
    };

    var response = await ordersData.orderApprove(data);

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        await getPendingOrders();
        await refreshOrderAccepted();
        final trackController = Get.find<TrackLocationController>();
        trackController.getCurrentLocation();
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() {
    getPendingOrders();

    super.onInit();
  }

  refreshOrderAccepted() async {
    AcceptedController acceptedController = Get.put(AcceptedController());
    await acceptedController.getAcceptedOrders();
  }
}
