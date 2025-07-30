import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:taxi_4030/src/pages/driver_auth/driver_license_upload/common/driver_license_upload_binding.dart';

import '../../pages/driver_auth/car_driver_register/common/car_driver_binding.dart';
import '../../pages/driver_auth/car_driver_register/views/car_driver_page.dart';
import '../../pages/driver_auth/driver_activity_info/common/driver_activity_info_binding.dart';
import '../../pages/driver_auth/driver_activity_info/views/driver_activity_info_page.dart';
import '../../pages/driver_auth/driver_license_upload/views/driver_license_upload_page.dart';
import '../../pages/driver_auth/driver_otp_verify/common/driver_otp_verify_binding.dart';
import '../../pages/driver_auth/driver_otp_verify/views/driver_otp_verify_page.dart';
import '../../pages/driver_auth/driver_personal_info/common/driver_personal_info_binding.dart';
import '../../pages/driver_auth/driver_personal_info/views/driver_personal_info_page.dart';
import '../../pages/driver_auth/motorcycle_driver_register/common/motorcycle_driver_binding.dart';
import '../../pages/driver_auth/motorcycle_driver_register/views/motorcycle_driver_page.dart';
import '../../pages/driver_auth/van_driver_register/common/van_driver_register_binding.dart';
import '../../pages/driver_auth/van_driver_register/views/van_driver_register_page.dart';
import '../../pages/driver_auth/vehicle_selection/common/vehicle_selection_binding.dart';
import '../../pages/driver_auth/vehicle_selection/view/vehicle_selection_page.dart';

import '../../pages/user_auth/phone_input/common/phone_input_page_binding.dart';
import '../../pages/user_auth/phone_input/view/phone_input_page_view.dart';
import '../../pages/home_page/commons/home_page_binding.dart';
import '../../pages/home_page/view/home_page_view.dart';
import '../../pages/trip_page/common/trip_page_binding.dart';
import '../../pages/trip_page/view/trip_page_view.dart';
import '../../pages/user_auth/user_otp_verify/common/user_otp_verify_page_binding.dart';
import '../../pages/user_auth/user_otp_verify/view/user_otp_verify_page_view.dart';
import '../../pages/user_auth/user_register/common/user_register_binding.dart';
import '../../pages/user_auth/user_register/view/user_register_page.dart';
import 'route_names.dart';

class TaxiAppPages {
  static final List<GetPage<dynamic>> routes = [
    _homePage,
    _phoneInput,
    _userOtpVerify,
    _userRegister,
    _vehicleSelection,
    _driverOtpVerify,
    _driverPersonalInfo,
  ];

  static GetPage<dynamic> get _phoneInput => GetPage(
    name: TaxiRouteNames.phoneInput.path,
    page: PhoneInputPageView.new,
    binding: PhoneInputPageBinding(),
    children: [_userOtpVerify],
  );

  static GetPage<dynamic> get _userOtpVerify => GetPage(
    name: TaxiRouteNames.userOtpVerify.path,
    page: UserOtpVerifyPageView.new,
    binding: UserOtpVerifyPageBinding(),
  );

  static GetPage<dynamic> get _driverOtpVerify => GetPage(
    name: TaxiRouteNames.driverOtpVerify.path,
    page: DriverOtpVerifyPage.new,
    binding: DriverOtpVerifyBinding(),
  );

  static GetPage<dynamic> get _homePage => GetPage(
    name: TaxiRouteNames.homePage.path,
    page: HomePage.new,
    binding: HomePageBinding(),
    children: [_tripPage],
  );

  static GetPage<dynamic> get _tripPage => GetPage(
    name: TaxiRouteNames.tripPage.path,
    page: TripPageView.new,
    binding: TripPageBinding(),
  );

  static GetPage<dynamic> get _userRegister => GetPage(
    name: TaxiRouteNames.userRegister.path,
    page: UserRegisterPage.new,
    binding: RegisterBinding(),
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
  );
}
