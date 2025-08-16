import 'route_paths.dart';

class Routes {
  final String uri;
  final String path;

  const Routes(this.uri, [final String? path]) : path = path ?? uri;
}

class TaxiRouteNames extends Routes {
  TaxiRouteNames(super.uri);

  static const Routes profile = Routes(RoutePaths.profile, RoutePaths.profile);

  static const Routes splashScreen = Routes(
    RoutePaths.splashScreen,
    RoutePaths.splashScreen,
  );

  /// Authentication
  static const Routes driverOtpVerify = Routes(
    RoutePaths.driverOtpVerify,
    RoutePaths.driverOtpVerify,
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

  static const Routes carCardUpload = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.carCardUpload,
    RoutePaths.carCardUpload,
  );

  static const Routes motorCycleCardUpload = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.motorCycleCardUpload,
    RoutePaths.motorCycleCardUpload,
  );

  static const Routes vanInformationInput = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.vanCardUpload +
        RoutePaths.vanInformationInput,
    RoutePaths.vanInformationInput,
  );

  static const Routes motorcycleInformationInput = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.motorCycleCardUpload +
        RoutePaths.motorcycleInformationInput,
    RoutePaths.motorcycleInformationInput,
  );

  static const Routes carInformationInput = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.carCardUpload +
        RoutePaths.carInformationInput,
    RoutePaths.carInformationInput,
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

  static const Routes carOwnerDetails = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.carCardUpload +
        RoutePaths.carInformationInput +
        RoutePaths.carOwnerDetails,
    RoutePaths.carOwnerDetails,
  );

  static const Routes motorcycleOwnerDetails = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.motorCycleCardUpload +
        RoutePaths.motorcycleInformationInput +
        RoutePaths.motorcycleOwnerDetails,
    RoutePaths.motorcycleOwnerDetails,
  );

  static const Routes carUploadInsurance = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.carCardUpload +
        RoutePaths.carInformationInput +
        RoutePaths.carOwnerDetails +
        RoutePaths.carUploadInsurance,
    RoutePaths.carUploadInsurance,
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

  static const Routes carSelfieAuth = Routes(
    RoutePaths.driverPersonalInfo +
        RoutePaths.driverActivityInfo +
        RoutePaths.driverLicenseUpload +
        RoutePaths.carCardUpload +
        RoutePaths.carInformationInput +
        RoutePaths.carOwnerDetails +
        RoutePaths.carUploadInsurance +
        RoutePaths.carSelfieAuth,
    RoutePaths.carSelfieAuth,
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

  static const Routes videoAuth = Routes(
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
        RoutePaths.videoAuth,
    RoutePaths.videoAuth,
  );

  static const Routes authPending = Routes(
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
        RoutePaths.videoAuth +
        RoutePaths.authPending,
    RoutePaths.authPending,
  );
}
