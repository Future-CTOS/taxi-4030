import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../pages/auth/otp_verify/common/otp_verify_page_binding.dart';
import '../../pages/auth/otp_verify/view/otp_verify_page_view.dart';
import '../../pages/auth/phone_input/common/phone_input_page_binding.dart';
import '../../pages/auth/phone_input/view/phone_input_page_view.dart';
import '../../pages/auth/register/common/register_binding.dart';
import '../../pages/auth/register/view/register_page.dart';
import '../../pages/home_page/commons/home_page_binding.dart';
import '../../pages/home_page/view/home_page_view.dart';
import '../../pages/trip_page/common/trip_page_binding.dart';
import '../../pages/trip_page/view/trip_page_view.dart';
import 'route_names.dart';

class TaxiAppPages {
  static final List<GetPage<dynamic>> routes = [
    _homePage,
    _phoneInput,
    _otpVerify,
    _register,
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

  static GetPage<dynamic> get _register => GetPage(
    name: TaxiRouteNames.register.path,
    page: RegisterPage.new,
    binding: RegisterBinding(),
  );
}
