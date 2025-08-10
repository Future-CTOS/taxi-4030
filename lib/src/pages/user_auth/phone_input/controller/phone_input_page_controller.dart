import 'package:either_dart/either.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/app_controller/app_controller.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../models/user_register_dto.dart';
import '../repository/phone_input_repository.dart';

class PhoneInputPageController extends GetxController {
  final _repository = PhoneInputRepository();

  final RxString countryCode = '+98'.obs;

  final TextEditingController phoneNumberTextController =
      TextEditingController();

  RxBool isReceiveCodeActive = false.obs;
  RxBool isLoading = false.obs;

  int? otpCode;
  final formKey = GlobalKey<FormState>();

  void onChangeTextField(String? text) {
    if (!Utils.isMobileValid(text?.trim() ?? '')) {
      isReceiveCodeActive.value = false;
      return;
    }
    isReceiveCodeActive.value = true;
  }

  Future<void> onSubmitPhoneNumberTap(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      await _requestOtp(context);
      Get.toNamed(TaxiRouteNames.userOtpVerify.uri);
    }
  }

  Future<void> _requestOtp(BuildContext context) async {
    isLoading.value = true;
    final UserRegisterDto registerDto = UserRegisterDto(
      phone: phoneNumberTextController.text,
    );
    final Either<String, Map<String, dynamic>> resultOrException =
        await _repository.requestOtp(dto: registerDto);
    isLoading.value = false;
    resultOrException.fold(
      (final error) => Utils.showSnackBar(
        context,
        text: 'خطایی رخ داد',
        status: StatusEnum.danger,
      ),
      (final response) {
        AppController.instance.phoneNumber = phoneNumberTextController.text;
        Get.toNamed(TaxiRouteNames.userOtpVerify.uri);
      },
    );
  }
}
