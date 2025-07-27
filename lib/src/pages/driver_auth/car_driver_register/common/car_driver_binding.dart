import 'package:get/get.dart';

import '../controller/car_driver_controller.dart';

class CarDriverBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => CarDriverController());
}
