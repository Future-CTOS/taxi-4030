import 'package:get/get.dart';

import '../controller/car_owner_controller.dart';

class CarOwnerBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => CarOwnerController());
}
