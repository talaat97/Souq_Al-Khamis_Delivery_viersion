import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:souq_al_khamis_delivey_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_delivey_version/core/function/tacking_with_google_maps.dart';
import 'package:souq_al_khamis_delivey_version/data/datacorse/models/delivery_model.dart';

import '../../core/class/status_request.dart';

import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datacorse/remote/model/orderDetailsModel.dart';
import '../../data/datacorse/remote/model/order_model.dart';
import '../../data/datacorse/remote/orders/orderDetailsData.dart';

class Orderdetailscontroller extends GetxController {
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  Completer<GoogleMapController>? googleMapController;
  CameraPosition? cameraPosition;
  Marker? myMarker;
  List<Marker> marker = [];
  List<OrderDetailsModel> orderDetailsList = [];
  late OrderModel orderModel;
  Position? position;
  double? latCurrent;
  double? longCurrent;
  late DeliveryUser user;

  @override
  void onInit() {
    googleMapController = Completer<GoogleMapController>();
    orderModel = Get.arguments['orderModel'];
    getCurrentLocation();
    intialData();
    super.onInit();
  }

  intialData() {
    initLocation();
    getOrderData();
  }

  initLocation() {
    if (orderModel.addressLat != null && orderModel.addressLang != null) {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(orderModel.addressLat!),
            double.parse(orderModel.addressLang!)),
        zoom: 12.4,
      );
      marker.add(Marker(
          markerId: const MarkerId('1'),
          position: LatLng(double.parse(orderModel.addressLat!),
              double.parse(orderModel.addressLang!))));
    }
  }

  getOrderData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderDetailsData.getData(
      orderModel.orderId!.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseList = response['data'];
        orderDetailsList.addAll(responseList.map(
          (e) => OrderDetailsModel.fromJson(e),
        ));

        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  itemPriceDiscount(price, discount) {
    return price - (price * (discount / 100));
  }

  goToTrackingLocation() {
    Get.toNamed(AppRoute.trackingLocation,
        arguments: {"orderModel": orderModel});
  }

  Future<void> getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    latCurrent = position!.latitude;
    longCurrent = position!.longitude;

    log('latCurrent: $latCurrent');
    log('longCurrent: $longCurrent');
    update();
  }

  navigateTogoogleMap() async {
    if (latCurrent == null || longCurrent == null) {
      await getCurrentLocation();
    }

    await openGoogleMaps(
      originLat: latCurrent!,
      originLng: longCurrent!,
      destLat: double.parse(orderModel.addressLat!),
      destLng: double.parse(orderModel.addressLang!),
    );
    await sendLocationToFirebase();
  }

  sendLocationToFirebase() async {
    getUser();
    FirebaseFirestore.instance
        .collection('orders')
        .doc(orderModel.orderId!.toString())
        .set({
      'deliveryLat': latCurrent,
      'deliveryLng': longCurrent,
      'deliveryId': user.id,
      'deliveryName': user.name,
      'deliveryPhone': user.phone,
    });
    log('--------------sending data to firestore--------------------');
    log(user.id.toString());
    log(user.name.toString());
    log(user.phone.toString());
    log(latCurrent.toString());
    log(longCurrent.toString());
    log('----------------------------------');
  }

  getUser() {
    final userString = myServices.sharedPreferences.getString('deliveryUser');
    Map<String, dynamic> deliveryUser = jsonDecode(userString!);
    user = DeliveryUser.fromJson(deliveryUser);
  }
}
