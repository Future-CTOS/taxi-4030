import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/infrastructures/routes/route_names.dart';
import 'package:taxi_4030/src/pages/auth/log_in/model/log_in_dto.dart';

import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../repository/log_in_page_repository.dart';

class LogInPageController extends GetxController {
  final LoginPageRepository _repository = LoginPageRepository();
  final TextEditingController phoneNumberTextEditingController =
      TextEditingController();

  final RxBool isSubmittingPhoneNumber = false.obs;

  Future<void> onSubmitPhoneNumberTap(BuildContext context) async {
    if (!Utils.isMobileValid(phoneNumberTextEditingController.text.trim())) {
      Utils.showSnackBar(
        context,
        text: 'WRONG NUMBER',
        status: StatusEnum.danger,
      );
      return;
    }
    isSubmittingPhoneNumber.value = true;
    final result = await _repository.logIn(dto: _dto());
    isSubmittingPhoneNumber.value = false;
    result.fold((left) => null, (right) {
      Utils.showSnackBar(context, text: "خوش آمدید", status: StatusEnum.success);
      Get.offAllNamed(TaxiRouteNames.homePage.path);
    });
  }

  LogInDto _dto() =>
      LogInDto(mobile: phoneNumberTextEditingController.text.trim());
}
