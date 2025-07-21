import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../pages/auth/log_in/commons/log_in_page_binding.dart';
import '../../pages/auth/log_in/view/log_in_page_view.dart';
import '../../pages/home_page/commons/home_page_binding.dart';
import '../../pages/home_page/view/home_page_view.dart';
import '../../pages/trip_page/common/trip_page_binding.dart';
import '../../pages/trip_page/view/trip_page_view.dart';
import 'route_names.dart';

class TaxiAppPages {
  static final List<GetPage<dynamic>> routes = [_homePage, _logIn];

  static GetPage<dynamic> get _logIn => GetPage(
    name: TaxiRouteNames.loginPage.path,
    page: LogInPageView.new,
    binding: LogInPageBinding(),
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
}
