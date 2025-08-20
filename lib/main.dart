import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taxi_4030/taxi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(TaxiApp());
}
