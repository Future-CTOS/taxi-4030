import 'package:get/get.dart';

import '../controller/van_card_upload_controller.dart';

class VanCardUploadBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => VanCardUploadController());
}
