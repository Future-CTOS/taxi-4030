import 'package:get/get.dart';

import '../controller/van_auth_pending_controller.dart';

class VanAuthPendingBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => VanAuthPendingController());
}
