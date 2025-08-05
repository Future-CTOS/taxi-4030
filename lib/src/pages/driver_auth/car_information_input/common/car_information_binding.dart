import 'package:get/get.dart';

import '../controller/car_information_controller.dart';

class CarInformationBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => CarInformationController());
}
