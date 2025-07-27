import 'package:get/get.dart';

import '../controller/phone_input_page_controller.dart';

class PhoneInputPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(PhoneInputPageController.new);
}
