import 'package:get/get.dart';

import '../controller/car_upload_insurance_information_controller.dart';

class CarUploadInsuranceInformationBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut(() => CarUploadInsuranceInformationController());
}
