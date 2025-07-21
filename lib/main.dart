import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taxi_4030/taxi_app.dart';

import 'src/infrastructures/app_controller/app_controller.dart';

void main() async {
  AppController().fullBaseUrl = 'https://api.zilbax.com';
  await GetStorage.init();
  runApp(TaxiApp());
}
