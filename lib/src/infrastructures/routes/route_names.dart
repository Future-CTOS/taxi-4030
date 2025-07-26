import 'route_paths.dart';

class Routes {
  final String uri;
  final String path;

  const Routes(this.uri, [final String? path]) : path = path ?? uri;
}

class TaxiRouteNames extends Routes {
  TaxiRouteNames(super.uri);

  /// home Page
  static const Routes homePage = Routes(
    RoutePaths.homePage,
    RoutePaths.homePage,
  );

  /// trip Page
  static const Routes tripPage = Routes(
    RoutePaths.homePage + RoutePaths.tripPage,
    RoutePaths.tripPage,
  );

  /// Authentication
  static const Routes otpVerify = Routes(
    RoutePaths.phoneInput + RoutePaths.otpVerify,
    RoutePaths.otpVerify,
  );
  static const Routes phoneInput = Routes(
    RoutePaths.phoneInput,
    RoutePaths.phoneInput,
  );

  static const Routes register = Routes(
    RoutePaths.register,
    RoutePaths.register,
  );

}
