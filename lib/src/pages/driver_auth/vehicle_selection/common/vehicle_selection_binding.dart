import 'package:get/get.dart';

import '../controller/vehicle_selection_controller.dart';

class VehicleSelectionBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => VehicleSelectionController(),);
}
