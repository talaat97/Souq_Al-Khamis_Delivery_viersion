import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:souq_al_khamis_delivey_version/core/class/status_request.dart';

import 'package:souq_al_khamis_delivey_version/data/datacorse/remote/model/order_model.dart';

class TrackLocationController extends GetxController {
  StreamSubscription<Position>? positionStream;
  Set<Marker> marker = {};
  StatusRequest statusRequest = StatusRequest.loading;
  GoogleMapController? gmc;
  List<LatLng> routePoints = [];
  /////////////// current position /////////////////
  CameraPosition? cameraPositionCurrent;
  double? latCurrent;
  double? longCurrent;
  /////////////////// destination position /////////////////
  CameraPosition? cameraPositionDestination;
  double? latDestination;
  double? longDestination;
  late OrderModel orderModel;

  @override
  void onInit() async {
    await getCurrentLocation();
    await getDestinationLocation();

    super.onInit();
  }

  getCurrentLocation() async {
    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 3,
      ),
    ).listen((Position currentPosition) async {
      latCurrent = currentPosition.latitude;
      longCurrent = currentPosition.longitude;

      marker.removeWhere((marker) => marker.markerId.value == 'current');
      marker.add(Marker(
        markerId: const MarkerId('current'),
        position: LatLng(latCurrent!, longCurrent!),
        infoWindow: const InfoWindow(
          title: "Delivery",
        ),
      ));
      log('======================================');
      log('latDelivery : $latCurrent');
      log('longDelivery : $longCurrent');
      log('======================================');

      cameraPositionCurrent = CameraPosition(
        target: LatLng(latCurrent!, longCurrent!),
        zoom: 12.4,
      );
      if (gmc != null) {
        gmc!.animateCamera(
          CameraUpdate.newCameraPosition(cameraPositionCurrent!),
        );
      }
      statusRequest = StatusRequest.success;

      update();
    }, onError: (error) {
      statusRequest = StatusRequest.failure;
      log(error.toString());
      update();
    });
  }

  getDestinationLocation() {
    orderModel = Get.arguments['orderModel'];
    latDestination = double.parse(orderModel.addressLat!);
    longDestination = double.parse(orderModel.addressLang!);

    marker.add(Marker(
      markerId: const MarkerId('destination'),
      position: LatLng(latDestination!, longDestination!),
      infoWindow: InfoWindow(
        title: orderModel.addressName,
      ),
    ));
    log('======================================');
    log('latCustomer : $latDestination');
    log('longCustomer : $longDestination');
    log('======================================');

    cameraPositionDestination = CameraPosition(
      target: LatLng(latDestination!, longDestination!),
      zoom: 12.4,
    );
  }

  @override
  void onClose() {
    positionStream?.cancel();

    super.onClose();
  }

  //  loadRoute() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   routePoints = await RouteService.getPolyline(
  //     originLat: 30.0444,
  //     originLng: 31.2357,
  //     destLat: 21.0500,
  //     destLng: 21.2400,
  //   );
  //   update();
  // }
}
