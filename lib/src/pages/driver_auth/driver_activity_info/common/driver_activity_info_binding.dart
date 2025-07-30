import 'package:get/get.dart';

import '../controller/driver_activity_info_controller.dart';

class DriverActivityInfoBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => DriverActivityInfoController());
}
