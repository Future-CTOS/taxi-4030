import 'package:get/get.dart';

import '../controller/motorcycle_selfie_auth_controller.dart';

class MotorcycleSelfieAuthBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => MotorcycleSelfieAuthController());
}
