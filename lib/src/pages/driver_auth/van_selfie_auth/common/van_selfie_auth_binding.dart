import 'package:get/get.dart';

import '../controller/van_selfie_auth_controller.dart';

class VanSelfieAuthBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => VanSelfieAuthController());
}
