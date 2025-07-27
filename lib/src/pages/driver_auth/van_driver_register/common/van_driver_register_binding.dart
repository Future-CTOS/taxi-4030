import 'package:get/get.dart';

import '../controller/van_driver_register_controller.dart';

class VanDriverRegisterBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => VanDriverRegisterController());
}
