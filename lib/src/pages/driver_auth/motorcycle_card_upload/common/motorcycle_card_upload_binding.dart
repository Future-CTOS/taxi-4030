import 'package:get/get.dart';

import '../controller/motorcycle_card_upload_controller.dart';

class MotorcycleCardUploadBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => MotorcycleCardUploadController());
}
