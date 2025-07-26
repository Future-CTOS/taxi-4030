import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import 'route_names.dart';

class TaxiRouteTitleMap {
  static final Map<String, String> routeTitleMap = {
    /// Home Page
    TaxiRouteNames.homePage.uri: LocaleKeys.taxi_4030_app_routes_home_page.tr,

    /// trip page
    TaxiRouteNames.tripPage.uri: LocaleKeys.taxi_4030_app_routes_trip_page.tr,

    /// Authentication
    TaxiRouteNames.otpVerify.uri: LocaleKeys.taxi_4030_app_routes_log_in.tr,
    TaxiRouteNames.phoneInput.uri: LocaleKeys.taxi_4030_app_routes_sign_up.tr,
  };
}
