import 'package:get/get.dart';

import '../controller/car_selfie_auth_controller.dart';

class CarSelfieAuthBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => CarSelfieAuthController());
}
