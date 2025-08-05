import 'package:get/get.dart';

import '../controller/car_card_upload_controller.dart';

class CarCardUploadBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => CarCardUploadController());
}
