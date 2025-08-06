import 'package:get/get.dart';

import '../controller/video_auth_controller.dart';

class VideoAuthBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => VideoAuthController());
}
