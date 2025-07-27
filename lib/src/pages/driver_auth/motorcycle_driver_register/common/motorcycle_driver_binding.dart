import 'package:get/get.dart';

import '../controller/motorcycle_driver_controller.dart';

class MotorcycleDriverBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => MotorcycleDriverController());
}
