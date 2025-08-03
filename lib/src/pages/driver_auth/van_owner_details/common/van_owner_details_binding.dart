import 'package:get/get.dart';

import '../controller/van_owner_details_controller.dart';

class VanOwnerDetailsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => VanOwnerDetailsController());
}
