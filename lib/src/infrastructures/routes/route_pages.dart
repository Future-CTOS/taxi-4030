import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:taxi_4030/src/infrastructures/routes/route_paths.dart';

import '../../pages/driver_auth/auth_guide_step1/views/auth_guide_step1_page.dart';
import '../../pages/driver_auth/auth_guide_step2/views/auth_guide_step2_page.dart';
import '../../pages/driver_auth/auth_guide_step3/views/auth_guide_step3_page.dart';
import '../../pages/driver_auth/auth_guide_step4/views/auth_guide_step4_page.dart';
import '../../pages/driver_auth/auth_pending/common/auth_pending_binding.dart';
import '../../pages/driver_auth/auth_pending/views/auth_pending_page.dart';
import '../../pages/driver_auth/car_card_upload/common/car_card_upload_binding.dart';
import '../../pages/driver_auth/car_card_upload/views/car_card_upload_page.dart';
import '../../pages/driver_auth/car_driver_register/common/car_driver_binding.dart';
import '../../pages/driver_auth/car_driver_register/views/car_driver_page.dart';
import '../../pages/driver_auth/car_information_input/common/car_information_binding.dart';
import '../../pages/driver_auth/car_information_input/views/car_information_page.dart';
import '../../pages/driver_auth/car_owner_details/common/car_owner_details_binding.dart';
import '../../pages/driver_auth/car_owner_details/views/car_owner_details_page.dart';
import '../../pages/driver_auth/car_selfie_auth/common/car_selfie_auth_binding.dart';
import '../../pages/driver_auth/car_selfie_auth/views/car_selfie_auth_page.dart';
import '../../pages/driver_auth/car_upload_insurance_information/common/car_upload_insurance_information_binding.dart';
import '../../pages/driver_auth/car_upload_insurance_information/views/car_upload_insurance_information_page.dart';
import '../../pages/driver_auth/driver_activity_info/common/driver_activity_info_binding.dart';
import '../../pages/driver_auth/driver_activity_info/views/driver_activity_info_page.dart';
import '../../pages/driver_auth/driver_license_upload/common/driver_license_upload_binding.dart';
import '../../pages/driver_auth/driver_license_upload/views/driver_license_upload_page.dart';
import '../../pages/driver_auth/driver_otp_verify/common/driver_otp_verify_binding.dart';
import '../../pages/driver_auth/driver_otp_verify/views/driver_otp_verify_page.dart';
import '../../pages/driver_auth/driver_personal_info/common/driver_personal_info_binding.dart';
import '../../pages/driver_auth/driver_personal_info/views/driver_personal_info_page.dart';
import '../../pages/driver_auth/motorcycle_card_upload/common/motorcycle_card_upload_binding.dart';
import '../../pages/driver_auth/motorcycle_card_upload/views/motorcycle_card_upload_page.dart';
import '../../pages/driver_auth/motorcycle_driver_register/common/motorcycle_driver_binding.dart';
import '../../pages/driver_auth/motorcycle_driver_register/views/motorcycle_driver_page.dart';
import '../../pages/driver_auth/motorcycle_information_input/common/motorcycle_information_input_binding.dart';
import '../../pages/driver_auth/motorcycle_information_input/views/motorcycle_information_input_page.dart';
import '../../pages/driver_auth/motorcycle_owner_details/common/motorcycle_owner_details_binding.dart';
import '../../pages/driver_auth/motorcycle_owner_details/views/motorcycle_owner_details_page.dart';
import '../../pages/driver_auth/motorcycle_selfie_auth/common/motorcycle_selfie_auth_binding.dart';
import '../../pages/driver_auth/motorcycle_selfie_auth/views/motorcycle_selfie_auth_page.dart';
import '../../pages/driver_auth/motorcycle_upload_insurance_information/common/motorcycle_upload_insurance_information_binding.dart';
import '../../pages/driver_auth/motorcycle_upload_insurance_information/views/motorcycle_upload_insurance_information_page.dart';
import '../../pages/driver_auth/van_card_upload/common/van_card_upload_binding.dart';
import '../../pages/driver_auth/van_card_upload/views/van_card_upload_page.dart';
import '../../pages/driver_auth/van_driver_register/common/van_driver_register_binding.dart';
import '../../pages/driver_auth/van_driver_register/views/van_driver_register_page.dart';
import '../../pages/driver_auth/van_information_input/common/van_information_binding.dart';
import '../../pages/driver_auth/van_information_input/views/van_information_page.dart';
import '../../pages/driver_auth/van_owner_details/common/van_owner_details_binding.dart';
import '../../pages/driver_auth/van_owner_details/views/van_owner_details_page.dart';
import '../../pages/driver_auth/van_selfie_auth/common/van_selfie_auth_binding.dart';
import '../../pages/driver_auth/van_selfie_auth/views/van_selfie_auth_page.dart';
import '../../pages/driver_auth/van_upload_insurance_information/common/van_upload_insurance_information_binding.dart';
import '../../pages/driver_auth/van_upload_insurance_information/views/van_upload_insurance_information_page.dart';
import '../../pages/driver_auth/vehicle_selection/common/vehicle_selection_binding.dart';
import '../../pages/driver_auth/vehicle_selection/view/vehicle_selection_page.dart';
import '../../pages/driver_auth/video_auth/common/video_auth_binding.dart';
import '../../pages/driver_auth/video_auth/views/video_auth_page.dart';
import '../../pages/profile/common/profile_binding.dart';
import '../../pages/profile/views/profile_page.dart';
import '../../pages/splash_screen/bindings/splash_screen_page_binding.dart';
import '../../pages/splash_screen/controllers/splash_screen_page_controller.dart';
import '../../pages/splash_screen/views/splash_screen_page.dart';
import 'route_names.dart';

class TaxiAppPages {
  static final List<GetPage<dynamic>> routes = [
    _splashScreen,
    _profile,
    _vehicleSelection,
    _driverOtpVerify,
    _driverPersonalInfo,
  ];

  static GetPage<SplashScreenPageController> get _splashScreen => GetPage(
    name: RoutePaths.splashScreen,
    page: SplashScreenPage.new,
    binding: SplashScreenPageBinding(),
  );

  static GetPage<SplashScreenPageController> get _profile => GetPage(
    name: RoutePaths.profile,
    page: ProfilePage.new,
    binding: ProfileBinding(),
  );

  static GetPage<dynamic> get _driverOtpVerify => GetPage(
    name: TaxiRouteNames.driverOtpVerify.path,
    page: DriverOtpVerifyPage.new,
    binding: DriverOtpVerifyBinding(),
  );

  static GetPage<dynamic> get _vehicleSelection => GetPage(
    name: TaxiRouteNames.vehicleSelection.path,
    page: VehicleSelectionPage.new,
    binding: VehicleSelectionBinding(),
    children: [
      _vanDriverRegister,
      _carDriverRegister,
      _motorcycleDriverRegister,
    ],
  );

  static GetPage<dynamic> get _vanDriverRegister => GetPage(
    name: TaxiRouteNames.vanDriverRegister.path,
    page: VanDriverRegisterPage.new,
    binding: VanDriverRegisterBinding(),
    children: [_driverOtpVerify],
  );

  static GetPage<dynamic> get _carDriverRegister => GetPage(
    name: TaxiRouteNames.carDriverRegister.path,
    page: CarDriverPage.new,
    binding: CarDriverBinding(),
    children: [_driverOtpVerify],
  );

  static GetPage<dynamic> get _motorcycleDriverRegister => GetPage(
    name: TaxiRouteNames.motorcycleRegister.path,
    page: MotorcycleDriverPage.new,
    binding: MotorcycleDriverBinding(),
    children: [_driverOtpVerify],
  );

  static GetPage<dynamic> get _driverPersonalInfo => GetPage(
    name: TaxiRouteNames.driverPersonalInfo.path,
    page: DriverPersonalInfoPage.new,
    binding: DriverPersonalInfoBinding(),
    children: [_driverActivityInfo],
  );

  static GetPage<dynamic> get _driverActivityInfo => GetPage(
    name: TaxiRouteNames.driverActivityInfo.path,
    page: DriverActivityInfoPage.new,
    binding: DriverActivityInfoBinding(),
    children: [_driverLicenseUpload],
  );

  static GetPage<dynamic> get _driverLicenseUpload => GetPage(
    name: TaxiRouteNames.driverLicenseUpload.path,
    page: DriverLicenseUploadPage.new,
    binding: DriverLicenseUploadBinding(),
    children: [_carCardUpload, _vanCardUpload, _motorCycleCardUpload],
  );

  static GetPage<dynamic> get _vanCardUpload => GetPage(
    name: TaxiRouteNames.vanCardUpload.path,
    page: VanCardUploadPage.new,
    binding: VanCardUploadBinding(),
    children: [_vanInformationInput],
  );

  static GetPage<dynamic> get _carCardUpload => GetPage(
    name: TaxiRouteNames.carCardUpload.path,
    page: CarCardUploadPage.new,
    binding: CarCardUploadBinding(),
    children: [_carInformationInput],
  );

  static GetPage<dynamic> get _motorCycleCardUpload => GetPage(
    name: TaxiRouteNames.motorCycleCardUpload.path,
    page: MotorcycleCardUploadPage.new,
    binding: MotorcycleCardUploadBinding(),
    children: [_motorCycleInformationInput],
  );

  static GetPage<dynamic> get _vanInformationInput => GetPage(
    name: TaxiRouteNames.vanInformationInput.path,
    page: VanInformationPage.new,
    binding: VanInformationBinding(),
    children: [_vanOwnerDetails],
  );

  static GetPage<dynamic> get _motorCycleInformationInput => GetPage(
    name: TaxiRouteNames.motorcycleInformationInput.path,
    page: MotorcycleInformationInputPage.new,
    binding: MotorcycleInformationInputBinding(),
    children: [_motorCycleOwnerDetails],
  );

  static GetPage<dynamic> get _carInformationInput => GetPage(
    name: TaxiRouteNames.carInformationInput.path,
    page: CarInformationPage.new,
    binding: CarInformationBinding(),
    children: [_carOwnerDetails],
  );

  static GetPage<dynamic> get _vanOwnerDetails => GetPage(
    name: TaxiRouteNames.vanOwnerDetails.path,
    page: VanOwnerDetailsPage.new,
    binding: VanOwnerDetailsBinding(),
    children: [_vanUploadInsurance],
  );

  static GetPage<dynamic> get _carOwnerDetails => GetPage(
    name: TaxiRouteNames.carOwnerDetails.path,
    page: CarOwnerDetailsPage.new,
    binding: CarOwnerDetailsBinding(),
    children: [_carUploadInsurance],
  );

  static GetPage<dynamic> get _motorCycleOwnerDetails => GetPage(
    name: TaxiRouteNames.motorcycleOwnerDetails.path,
    page: MotorcycleOwnerDetailsPage.new,
    binding: MotorcycleOwnerDetailsBinding(),
    children: [_motorcycleUploadInsurance],
  );

  static GetPage<dynamic> get _carUploadInsurance => GetPage(
    name: TaxiRouteNames.carUploadInsurance.path,
    page: CarUploadInsuranceInformationPage.new,
    binding: CarUploadInsuranceInformationBinding(),
    children: [_carSelfieAuth],
  );

  static GetPage<dynamic> get _motorcycleUploadInsurance => GetPage(
    name: TaxiRouteNames.motorcycleUploadInsurance.path,
    page: MotorcycleUploadInsuranceInformationPage.new,
    binding: MotorcycleUploadInsuranceInformationBinding(),
    children: [_motorcycleSelfieAuth],
  );

  static GetPage<dynamic> get _vanUploadInsurance => GetPage(
    name: TaxiRouteNames.vanUploadInsurance.path,
    page: VanUploadInsuranceInformationPage.new,
    binding: VanUploadInsuranceInformationBinding(),
    children: [_vanSelfieAuth],
  );

  static GetPage<dynamic> get _motorcycleSelfieAuth => GetPage(
    name: TaxiRouteNames.motorcycleSelfieAuth.path,
    page: MotorcycleSelfieAuthPage.new,
    binding: MotorcycleSelfieAuthBinding(),
    children: [_authGuideStep1],
  );

  static GetPage<dynamic> get _vanSelfieAuth => GetPage(
    name: TaxiRouteNames.vanSelfieAuth.path,
    page: VanSelfieAuthPage.new,
    binding: VanSelfieAuthBinding(),
    children: [_authGuideStep1],
  );

  static GetPage<dynamic> get _carSelfieAuth => GetPage(
    name: TaxiRouteNames.carSelfieAuth.path,
    page: CarSelfieAuthPage.new,
    binding: CarSelfieAuthBinding(),
    children: [_authGuideStep1],
  );

  static GetPage<dynamic> get _authGuideStep1 => GetPage(
    name: TaxiRouteNames.authGuideStep1.path,
    page: AuthGuideStep1Page.new,
    children: [_authGuideStep2],
  );

  static GetPage<dynamic> get _authGuideStep2 => GetPage(
    name: TaxiRouteNames.authGuideStep2.path,
    page: AuthGuideStep2Page.new,
    children: [_authGuideStep3],
  );

  static GetPage<dynamic> get _authGuideStep3 => GetPage(
    name: TaxiRouteNames.authGuideStep3.path,
    page: AuthGuideStep3Page.new,
    children: [_authGuideStep4],
  );

  static GetPage<dynamic> get _authGuideStep4 => GetPage(
    name: TaxiRouteNames.authGuideStep4.path,
    page: AuthGuideStep4Page.new,
    children: [_videoAuth],
  );

  static GetPage<dynamic> get _videoAuth => GetPage(
    name: TaxiRouteNames.videoAuth.path,
    page: VideoAuthPage.new,
    binding: VideoAuthBinding(),
    children: [_authPending],
  );

  static GetPage<dynamic> get _authPending => GetPage(
    name: TaxiRouteNames.authPending.path,
    page: AuthPendingPage.new,
    binding: AuthPendingBinding(),
  );
}
