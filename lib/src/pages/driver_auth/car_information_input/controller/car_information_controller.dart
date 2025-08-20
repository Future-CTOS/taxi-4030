import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../models/dtos/car_information_input_dto.dart';
import '../models/view_models/car_information_input_view_model.dart';
import '../repositories/car_information_input_repository.dart';

class CarInformationController extends GetxController {
  final _repository = CarInformationInputRepository();
  final RxString selectedLetter = 'ب'.obs;
  final RxBool isFormFilled = false.obs;
  final RxBool isLoading = false.obs;
  Rxn<CarInformationInputViewModel> carInformation =
      Rxn<CarInformationInputViewModel>();
  Rxn<String> carType = Rxn();
  Rxn<String> carYear = Rxn();
  Rxn<String> carColor = Rxn();
  String? licensePlate;

  void onCompletedIranianPlate(String? value) => licensePlate = value;

  Future<void> _submitCarInfo(BuildContext context) async {
    isLoading.value = true;
    final CarInformationInputDto dto = CarInformationInputDto(
      color: carColor.value!,
      model: carType.value!,
      year: carYear.value!,
      licensePlate: licensePlate!,
    );
    final Either<String, String> resultOrException = await _repository
        .submitCarInformation(dto: dto);
    isLoading.value = false;
    resultOrException.fold(
      (final errorMessage) => Utils.showSnackBar(
        context,
        text: errorMessage,
        status: StatusEnum.danger,
      ),
      (final response) {
        Utils.showSnackBar(context, text: response, status: StatusEnum.success);
        Get.offAndToNamed(TaxiRouteNames.carOwnerDetails.uri);
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

    _submitCarInfo(context);
  }

  Future<void> _fetchCarOptions(BuildContext context) async {
    isLoading.value = true;
    final Either<String, CarInformationInputViewModel> result =
        await _repository.fetchCarOptions();
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
    _fetchCarOptions(Get.context!);
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
