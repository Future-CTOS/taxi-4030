import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:taxi_4030/src/pages/driver_auth/car_driver_register/common/car_driver_binding.dart';
import 'package:taxi_4030/src/pages/driver_auth/motorcycle_driver_register/common/motorcycle_driver_binding.dart';

import '../../pages/driver_auth/car_driver_register/views/car_driver_page.dart';
import '../../pages/driver_auth/driver_register/common/driver_register_binding.dart';
import '../../pages/driver_auth/driver_register/view/driver_register_page.dart';
import '../../pages/driver_auth/motorcycle_driver_register/views/motorcycle_driver_page.dart';
import '../../pages/driver_auth/van_driver_register/common/van_driver_register_binding.dart';
import '../../pages/driver_auth/van_driver_register/views/van_driver_register_page.dart';
import '../../pages/user_auth/otp_verify/common/otp_verify_page_binding.dart';
import '../../pages/user_auth/otp_verify/view/otp_verify_page_view.dart';
import '../../pages/user_auth/phone_input/common/phone_input_page_binding.dart';
import '../../pages/user_auth/phone_input/view/phone_input_page_view.dart';
import '../../pages/home_page/commons/home_page_binding.dart';
import '../../pages/home_page/view/home_page_view.dart';
import '../../pages/trip_page/common/trip_page_binding.dart';
import '../../pages/trip_page/view/trip_page_view.dart';
import '../../pages/user_auth/user_register/common/user_register_binding.dart';
import '../../pages/user_auth/user_register/view/user_register_page.dart';
import 'route_names.dart';

class TaxiAppPages {
  static final List<GetPage<dynamic>> routes = [
    _homePage,
    _phoneInput,
    _otpVerify,
    _userRegister,
    _driverRegister,
  ];

  static GetPage<dynamic> get _phoneInput => GetPage(
    name: TaxiRouteNames.phoneInput.path,
    page: PhoneInputPageView.new,
    binding: PhoneInputPageBinding(),
    children: [_otpVerify],
  );

  static GetPage<dynamic> get _otpVerify => GetPage(
    name: TaxiRouteNames.otpVerify.path,
    page: OtpVerifyPageView.new,
    binding: OtpVerifyPageBinding(),
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

  static GetPage<dynamic> get _driverRegister => GetPage(
    name: TaxiRouteNames.driverRegister.path,
    page: DriverRegisterPage.new,
    binding: DriverRegisterBinding(),
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
  );

  static GetPage<dynamic> get _carDriverRegister => GetPage(
    name: TaxiRouteNames.carDriverRegister.path,
    page: CarDriverPage.new,
    binding: CarDriverBinding(),
  );

  static GetPage<dynamic> get _motorcycleDriverRegister => GetPage(
    name: TaxiRouteNames.motorcycleRegister.path,
    page: MotorcycleDriverPage.new,
    binding: MotorcycleDriverBinding(),
  );
}
