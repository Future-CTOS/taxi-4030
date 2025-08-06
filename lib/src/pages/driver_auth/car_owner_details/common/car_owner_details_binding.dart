import 'package:get/get.dart';

import '../controller/car_owner_details_controller.dart';

class CarOwnerDetailsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => CarOwnerDetailsController());
}
