import 'package:get/get.dart';

import '../controller/user_otp_verify_page_controller.dart';

class UserOtpVerifyPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(UserOtpVerifyPageController.new);
}
