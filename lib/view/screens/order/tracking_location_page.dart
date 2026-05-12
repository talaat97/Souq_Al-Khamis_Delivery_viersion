import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:souq_al_khamis_delivey_version/controller/order/track_location_contoller.dart';

import '../../../core/class/handling_data.dart';
import '../../../core/theme/app_theme.dart';

class TrackingLocationPage extends StatelessWidget {
  const TrackingLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackLocationController());
    return Scaffold(
      body: AppBackground(
        child: GetBuilder<TrackLocationController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: controller.cameraPositionCurrent ??
                  controller.cameraPositionDestination ??
                  const CameraPosition(
                    target: LatLng(40.0444, 31.2357), // Cairo
                    zoom: 12,
                  ),
              onMapCreated: (GoogleMapController controllerMap) {
                controller.gmc = controllerMap;
              },
              markers: controller.marker,
              myLocationEnabled: false,
              zoomControlsEnabled: false,
            ),
          ),
        ),
      ),
    );
  }
}
