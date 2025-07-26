import 'package:get/get.dart';

import '../controller/otp_verify_page_controller.dart';

class OtpVerifyPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(OtpVerifyPageController.new);
}
