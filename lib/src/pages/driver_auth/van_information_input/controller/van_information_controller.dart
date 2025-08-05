import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/route_names.dart';

class VanInformationController extends GetxController {
  final RxString selectedLetter = 'ب'.obs;
  final RxBool isFormFilled = false.obs;
  final RxBool isLoading = false.obs;

  void onCompletedIranianPlate(String? value) {
    isFormFilled.value = true;
    print(value);
  }

  Future<void> submitVanInfo() async {
    if (!isFormFilled.value) return;
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));

      Get.toNamed(TaxiRouteNames.vanOwnerDetails.uri);
    } finally {
      isLoading.value = false;
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
}
