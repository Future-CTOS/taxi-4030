import 'package:get_storage/get_storage.dart';

class AppController {
  factory AppController() => _instance;

  AppController._();

  static final AppController _instance = AppController._();

  final storage = GetStorage();

  late final String fullBaseUrl;
  String? userToken;
}
