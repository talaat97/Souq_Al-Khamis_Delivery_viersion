import 'package:get/get.dart';
import 'package:souq_al_khamis_delivey_version/controller/order/acceptedController.dart';

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
  var acceptedController = Get.put(AcceptedController());
  getPendingOrders() async {
    ordersPending.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getPendingOrders();
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        ordersPending.addAll(responseData.map((e) => OrderModel.fromJson(e)));
        statusRequest = StatusRequest.sucess;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void goToOrderDetails(OrderModel orderModel) {
    Get.toNamed(AppRoute.orderDeitails, arguments: {
      'orderModel': orderModel,
    });
  }

  orderApprove(OrderModel orderModel) async {
    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      "deliveryId":
          myServices.sharedPreferences.getString('deliveryId').toString(),
      "deliveryName":
          myServices.sharedPreferences.getString('deliveryName').toString(),
      "userId": orderModel.orderUserid,
      "orderId": orderModel.orderId,
      "userDeviceToken": orderModel.orderUserDevicetoken,
    };
    print(data);
    var response = await ordersData.orderApprove(data).timeout(
      const Duration(seconds: 7),
      onTimeout: () {
        return {'status': 'failure', 'message': 'Request timed out'};
      },
    );
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        await Future.wait<void>([
          getPendingOrders(),
          acceptedController.getAcceptedOrders(),
        ]);

        getPendingOrders();
        acceptedController.getAcceptedOrders();
        statusRequest = StatusRequest.sucess;
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    getPendingOrders();

    super.onInit();
  }
}
