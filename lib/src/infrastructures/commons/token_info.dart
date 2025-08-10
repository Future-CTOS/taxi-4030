import '../app_controller/app_controller.dart';
import '../utils/constants.dart';

class TokenInfo {
  static Map<String, String> userAuthHeader() => {
    Constants.authorization:
        '${Constants.bearer} ${AppController.instance.userToken}',
  };

  static Map<String, String> driverAuthHeader() => {
    Constants.authorization:
    '${Constants.bearer} ${AppController.instance.driverToken}',
  };
}
