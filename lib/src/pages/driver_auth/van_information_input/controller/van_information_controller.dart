import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../models/dtos/van_information_input_dto.dart';
import '../models/view_models/van_information_input_view_model.dart';
import '../repositories/van_information_input_repository.dart';

class VanInformationController extends GetxController {
  final _repository = VanInformationInputRepository();
  final RxString selectedLetter = 'ب'.obs;
  final RxBool isFormFilled = false.obs;
  final RxBool isLoading = false.obs;
  Rxn<VanInformationInputViewModel> vanInformation =
      Rxn<VanInformationInputViewModel>();
  Rxn<String> vanYear = Rxn();
  Rxn<String> vanType = Rxn();
  Rxn<String> vanColor = Rxn();
  Rxn<String> vanLoadCapacity = Rxn();
  String? licensePlate;

  void onCompletedIranianPlate(String? value) => licensePlate = value;

  Future<void> submitMotorcycleInfo(BuildContext context) async {
    isLoading.value = true;
    final VanInformationInputDto dto = VanInformationInputDto(
      type: vanType.value!,
      licensePlate: licensePlate!,
      modelYear: vanYear.value.toString(),
      loadCapacity: vanLoadCapacity.value.toString(),
      color: vanColor.value!,
    );
    final Either<String, String> resultOrException = await _repository
        .submitVanInformation(dto: dto);
    isLoading.value = false;
    resultOrException.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        Utils.showSnackBar(context, text: response, status: StatusEnum.success);
        Get.offAndToNamed(TaxiRouteNames.vanOwnerDetails.uri);
      },
    );
  }

  Future<void> _fetchMotorcycleOptions(BuildContext context) async {
    isLoading.value = true;
    final Either<String, VanInformationInputViewModel> result =
        await _repository.fetchVanOptions();
    isLoading.value = false;
    result.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        vanInformation.value = response;
        vanType.value = vanInformation.value!.vanTypes.first;
        vanYear.value = vanInformation.value!.vanYears.first;
        vanColor.value = vanInformation.value!.vanColors.first;
        vanLoadCapacity.value = vanInformation.value!.vanLoadCapacities.first;
      },
    );
  }

  void onSelectedVanTypeItem(final value) {
    vanType.value = value;
    checkForActivateContinue();
  }

  void onSelectedVanYearItem(final value) {
    vanYear.value = value;
    checkForActivateContinue();
  }

  void onSelectedVanColorItem(final value) {
    vanColor.value = value;
    checkForActivateContinue();
  }

  void onSelectedVanLoadCapacityItem(final value) {
    vanLoadCapacity.value = value;
    checkForActivateContinue();
  }

  void checkForActivateContinue() {
    if (vanInformation.value != null &&
        vanType.value != null &&
        vanYear.value != null &&
        vanColor.value != null &&
        vanLoadCapacity.value != null) {
      isFormFilled.value = true;
    }
  }

  List<String> get iranAllLicensePlateLetters => [
    'ب',
    'پ',
    'ت',
    'ث',
    'ج',
    'چ',
    'ح',
    'خ',
    'د',
    'ذ',
    'ر',
    'ز',
    'ژ',
    'س',
    'ش',
    'ص',
    'ض',
    'ط',
    'ظ',
    'ع',
    'غ',
    'ف',
    'ق',
    'ک',
    'گ',
    'ل',
    'م',
    'ن',
    'و',
    'ه',
    'ی',
  ];

  @override
  void onInit() {
    _fetchMotorcycleOptions(Get.context!);
    super.onInit();
  }
}
