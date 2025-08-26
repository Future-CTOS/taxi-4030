import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../models/dtos/motorcycle_information_input_dto.dart';
import '../models/view_models/motorcycle_information_input_view_model.dart';
import '../repositories/motorcycle_information_input_repository.dart';

class MotorcycleInformationInputController extends GetxController {
  final _repository = MotorcycleInformationInputRepository();

  final RxString selectedLetter = 'ب'.obs;
  final RxBool isFormFilled = false.obs;
  final RxBool isLoading = false.obs;

  Rxn<MotorcycleInformationInputViewModel> motorcycleInformation =
      Rxn<MotorcycleInformationInputViewModel>();
  Rxn<String> motorcycleType = Rxn();
  Rxn<String> motorcycleCapacityEngine = Rxn();
  Rxn<String> safetyEquipment = Rxn();
  String? licensePlate;

  void onCompletedIranianPlate(String? value) => licensePlate = value;


  Future<void> submitMotorcycleInfo(BuildContext context) async {
    isLoading.value = true;
    final MotorcycleInformationInputDto dto = MotorcycleInformationInputDto(
      type: motorcycleType.value!,
      licensePlate: licensePlate!,
      safetyEquipments: safetyEquipment.value!,
      engineCapacity: motorcycleCapacityEngine.value!,
    );
    final Either<String, String> resultOrException = await _repository
        .submitMotorcycleInformation(dto: dto);
    isLoading.value = false;
    resultOrException.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        Utils.showSnackBar(context, text: response, status: StatusEnum.success);
        Get.offAndToNamed(TaxiRouteNames.motorcycleOwnerDetails.uri);
      },
    );
  }

  Future<void> _fetchMotorcycleOptions(BuildContext context) async {
    isLoading.value = true;
    final Either<String, MotorcycleInformationInputViewModel> result =
        await _repository.fetchMotorcycleOptions();
    isLoading.value = false;
    result.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        motorcycleInformation.value = response;
        motorcycleType.value =
            motorcycleInformation.value!.motorcycleTypes.first;
        motorcycleCapacityEngine.value =
            motorcycleInformation.value!.motorcycleCapacityEngine.first;
      },
    );
  }

  void onSelectedMotorCycleTypeItem(final value) {
    motorcycleType.value = value;
    checkForActivateContinue();
  }

  void onSelectedMotorCycleEngineTypeItem(final value) {
    motorcycleCapacityEngine.value = value;
    checkForActivateContinue();
  }

  void onSelectedMotorCycleEngineSafetyEquipmentItem(final value) {
    safetyEquipment.value = value;
    checkForActivateContinue();
  }

  void checkForActivateContinue() {
    if (motorcycleInformation.value != null &&
        motorcycleType.value != null &&
        motorcycleCapacityEngine.value != null &&
        safetyEquipment.value != null) {
      isFormFilled.value = true;
    }
  }

  @override
  void onInit() {
    _fetchMotorcycleOptions(Get.context!);
    super.onInit();
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

  List<String> get safetyEquipments => ['بله', 'خیر'];
}
