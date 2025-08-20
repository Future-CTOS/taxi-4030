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

  Rxn<MotorcycleInformationInputViewModel> carInformation =
      Rxn<MotorcycleInformationInputViewModel>();
  Rxn<String> carType = Rxn();
  Rxn<String> carYear = Rxn();
  Rxn<String> carColor = Rxn();
  String? licensePlate;

  void onCompletedIranianPlate(String? value) => licensePlate = value;

  Future<void> _submitMotorcycleInfo(BuildContext context) async {
    isLoading.value = true;
    final MotorcycleInformationInputDto dto = MotorcycleInformationInputDto(
      color: carColor.value!,
      type: carType.value!,
      modelYear: carYear.value!,
      licensePlate: licensePlate!,
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

  Future<void> submitDriverInfo(BuildContext context) async {
    if (carInformation.value != null &&
        carType.value != null &&
        carYear.value != null &&
        carColor.value != null) {
      isFormFilled.value = true;
    }

    if (!isFormFilled.value) return;

    _submitMotorcycleInfo(context);
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
        carInformation.value = response;
        carType = carInformation.value!.carModels.first;
        carYear = carInformation.value!.carYears.first;
        carColor = carInformation.value!.carColors.first;
      },
    );
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
}
