import 'package:get/get.dart';

import '../controller/auth_pending_controller.dart';

class AuthPendingBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => AuthPendingController());
}
