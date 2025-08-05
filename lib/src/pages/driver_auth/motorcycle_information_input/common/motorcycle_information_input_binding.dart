import 'package:get/get.dart';

import '../controller/motorcycle_information_input_controller.dart';

class MotorcycleInformationInputBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut(() => MotorcycleInformationInputController());
}
