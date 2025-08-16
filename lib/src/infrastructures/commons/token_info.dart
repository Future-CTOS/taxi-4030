import '../app_controller/app_controller.dart';
import '../utils/constants.dart';

class TokenInfo {
  static Map<String, String> authHeader() => {
    Constants.authorization:
    '${Constants.bearer} ${AppController.instance.driverToken}',
  };
}
