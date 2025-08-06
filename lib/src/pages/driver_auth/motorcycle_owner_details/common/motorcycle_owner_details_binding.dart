import 'package:get/get.dart';

import '../controller/motorcycle_owner_details_controller.dart';

class MotorcycleOwnerDetailsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => MotorcycleOwnerDetailsController());
}
