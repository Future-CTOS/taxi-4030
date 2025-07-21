import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/pages/trip_page/controller/trip_page_controller.dart';

import '../../../components/scaffold.dart';

class TripPageView extends GetView<TripPageController> {
  const TripPageView({super.key});

  @override
  Widget build(BuildContext context) =>
      CustomScaffold(pageTitle: '-', body: Placeholder());
}
