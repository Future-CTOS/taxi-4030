import 'package:get/get.dart';

import '../controller/van_information_controller.dart';

class VanInformationBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => VanInformationController());
}
