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
  static const Routes userOtpVerify = Routes(
    RoutePaths.phoneInput + RoutePaths.userOtpVerify,
    RoutePaths.userOtpVerify,
  );
  static const Routes driverOtpVerify = Routes(
    RoutePaths.driverOtpVerify,
    RoutePaths.driverOtpVerify,
  );
  static const Routes phoneInput = Routes(
    RoutePaths.phoneInput,
    RoutePaths.phoneInput,
  );

  static const Routes userRegister = Routes(
    RoutePaths.userRegister,
    RoutePaths.userRegister,
  );

  static const Routes vehicleSelection = Routes(
    RoutePaths.vehicleSelection,
    RoutePaths.vehicleSelection,
  );

  static const Routes vanDriverRegister = Routes(
    RoutePaths.vehicleSelection + RoutePaths.vanDriverRegister,
    RoutePaths.vanDriverRegister,
  );

  static const Routes carDriverRegister = Routes(
    RoutePaths.vehicleSelection + RoutePaths.carDriverRegister,
    RoutePaths.carDriverRegister,
  );

  static const Routes motorcycleRegister = Routes(
    RoutePaths.vehicleSelection + RoutePaths.motorcycleDriverRegister,
    RoutePaths.motorcycleDriverRegister,
  );

  static const Routes driverPersonalInfo = Routes(
    RoutePaths.driverPersonalInfo,
    RoutePaths.driverPersonalInfo,
  );

  static const Routes driverActivityInfo = Routes(
    RoutePaths.driverPersonalInfo + RoutePaths.driverActivityInfo,
    RoutePaths.driverActivityInfo,
  );

  static const Routes driverLicenseUpload = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload,
    RoutePaths.driverLicenseUpload,
  );

  static const Routes vanCardUpload = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.vanCardUpload,
    RoutePaths.vanCardUpload,
  );

  static const Routes vanInformationInput = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.vanCardUpload +
        RoutePaths.vanInformationInput,
    RoutePaths.vanInformationInput,
  );

  static const Routes vanOwnerDetails = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.vanCardUpload +
        RoutePaths.vanInformationInput +
        RoutePaths.vanOwnerDetails,
    RoutePaths.vanOwnerDetails,
  );

  static const Routes vanUploadInsurance = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.vanCardUpload +
        RoutePaths.vanInformationInput +
        RoutePaths.vanOwnerDetails +
        RoutePaths.vanUploadInsurance,
    RoutePaths.vanUploadInsurance,
  );

  static const Routes vanSelfieAuth = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.vanCardUpload +
        RoutePaths.vanInformationInput +
        RoutePaths.vanOwnerDetails +
        RoutePaths.vanUploadInsurance +
        RoutePaths.vanSelfieAuth,
    RoutePaths.vanSelfieAuth,
  );

  static const Routes authGuideStep1 = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.vanCardUpload +
        RoutePaths.vanInformationInput +
        RoutePaths.vanOwnerDetails +
        RoutePaths.vanUploadInsurance +
        RoutePaths.vanSelfieAuth +
        RoutePaths.authGuideStep1,
    RoutePaths.authGuideStep1,
  );

  static const Routes authGuideStep2 = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.vanCardUpload +
        RoutePaths.vanInformationInput +
        RoutePaths.vanOwnerDetails +
        RoutePaths.vanUploadInsurance +
        RoutePaths.vanSelfieAuth +
        RoutePaths.authGuideStep1 +
        RoutePaths.authGuideStep2,
    RoutePaths.authGuideStep2,
  );

  static const Routes authGuideStep3 = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.vanCardUpload +
        RoutePaths.vanInformationInput +
        RoutePaths.vanOwnerDetails +
        RoutePaths.vanUploadInsurance +
        RoutePaths.vanSelfieAuth +
        RoutePaths.authGuideStep1 +
        RoutePaths.authGuideStep2 +
        RoutePaths.authGuideStep3,
    RoutePaths.authGuideStep3,
  );

  static const Routes authGuideStep4 = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.vanCardUpload +
        RoutePaths.vanInformationInput +
        RoutePaths.vanOwnerDetails +
        RoutePaths.vanUploadInsurance +
        RoutePaths.vanSelfieAuth +
        RoutePaths.authGuideStep1 +
        RoutePaths.authGuideStep2 +
        RoutePaths.authGuideStep3 +
        RoutePaths.authGuideStep4,
    RoutePaths.authGuideStep4,
  );

  static const Routes vanVideoAuth = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.vanCardUpload +
        RoutePaths.vanInformationInput +
        RoutePaths.vanOwnerDetails +
        RoutePaths.vanUploadInsurance +
        RoutePaths.vanSelfieAuth +
        RoutePaths.authGuideStep1 +
        RoutePaths.authGuideStep2 +
        RoutePaths.authGuideStep3 +
        RoutePaths.authGuideStep4 +
        RoutePaths.vanVideoAuth,
    RoutePaths.vanVideoAuth,
  );

  static const Routes vanAuthPending = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.vanCardUpload +
        RoutePaths.vanInformationInput +
        RoutePaths.vanOwnerDetails +
        RoutePaths.vanUploadInsurance +
        RoutePaths.vanSelfieAuth +
        RoutePaths.authGuideStep1 +
        RoutePaths.authGuideStep2 +
        RoutePaths.authGuideStep3 +
        RoutePaths.authGuideStep4 +
        RoutePaths.vanVideoAuth +
        RoutePaths.vanAuthPending,
    RoutePaths.vanAuthPending,
  );
}
