import 'package:get/get.dart';

import '../controller/van_video_auth_controller.dart';

class VanVideoAuthBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => VanVideoAuthController());
}
