import 'package:get/get.dart';
import 'package:souq_al_khamis_delivey_version/controller/order/track_location_contoller.dart';

import '../core/class/curd.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() => TrackLocationController(), fenix: true);
  }
  
}
