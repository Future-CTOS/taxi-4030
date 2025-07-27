import 'package:get/get.dart';

import '../controller/user_register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(UserRegisterController.new);
}
