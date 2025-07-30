import 'package:get/get.dart';

import '../controller/driver_personal_info_controller.dart';

class DriverPersonalInfoBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => DriverPersonalInfoController());
}
