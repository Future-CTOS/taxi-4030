import 'package:get/get.dart';

import '../controller/driver_register_controller.dart';

class DriverRegisterBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => DriverRegisterController(),);
}
