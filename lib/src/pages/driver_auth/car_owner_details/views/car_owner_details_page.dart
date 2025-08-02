import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/drop_down.dart';
import 'package:taxi_4030/src/components/scaffold.dart';

import '../controller/car_owner_controller.dart';

class CarOwnerDetailsPage extends GetView<CarOwnerController> {
  const CarOwnerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ['خودم هستم', 'شخص دیگر'];
    return CustomScaffold(
      body: Column(
        children: [
          CustomDropDown(items: items, getTitle: (item) => '', value: ''),
        ],
      ),
    );
  }
}
