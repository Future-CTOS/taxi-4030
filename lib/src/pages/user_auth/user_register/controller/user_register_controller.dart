import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/app_controller/app_controller.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../../infrastructures/utils/validators.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../models/user_register_dto.dart';
import '../models/user_register_view_model.dart';
import '../repository/user_register_page_repository.dart';

class UserRegisterController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final nationalCodeController = TextEditingController();
  final referralCoe = TextEditingController();
  final isFormFilled = false.obs;
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final Rx<DateTime> selectedDateTime = Rx(DateTime.now());
  final _repository = UserRegisterPageRepository();

  @override
  void onInit() {
    super.onInit();
    firstNameController.addListener(_checkFormStatus);
    lastNameController.addListener(_checkFormStatus);
    nationalCodeController.addListener(_checkFormStatus);
  }

  void _checkFormStatus() {
    final firstNameValid =
        Validators.validateFirstName(firstNameController.text) == null;
    final lastNameValid =
        Validators.validateLastName(lastNameController.text) == null;
    final nationalCodeValid =
        Validators.nationalCodeValidator(nationalCodeController.text) == null;
    isFormFilled.value = firstNameValid && lastNameValid && nationalCodeValid;
  }

  Future<void> _userRegister(BuildContext context) async {
    isLoading.value = true;
    final UserRegisterDto registerDto = UserRegisterDto(
      phone: AppController.instance.phoneNumber!,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      nationalCode: nationalCodeController.text,
      birthday: selectedDateTime.value.toString(),
      referralCode: referralCoe.text,
    );
    final Either<String, UserRegisterViewModel> resultOrException =
        await _repository.userRegister(dto: registerDto);
    isLoading.value = false;
    resultOrException.fold(
      (final _) => Utils.showSnackBar(
        context,
        text: 'خطایی رخ داد',
        status: StatusEnum.danger,
      ),
      (final response) {
        AppController.instance.userToken = response.accessToken;
        Get.offAndToNamed(TaxiRouteNames.profile.uri);
      },
    );
  }

  Future<void> submitUserInfo(BuildContext context) async {
    if (!isFormFilled.value) return;
    try {
      await _userRegister(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    nationalCodeController.dispose();
    super.onClose();
  }
}
