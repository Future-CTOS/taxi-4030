import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/infrastructures/routes/route_names.dart';

import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../controller/vehicle_selection_controller.dart';
import 'widgets/vehicle_card.dart';

class VehicleSelectionPage extends GetView<VehicleSelectionController> {
  const VehicleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(body: _body(context));

  Widget _body(BuildContext context) => Column(
    children: [
      Expanded(flex: 1, child: _headerContent(context)),
      Expanded(flex: 3, child: _items()),
    ],
  );

  Widget _headerContent(BuildContext context) => Column(
    children: [
      Text(
        'ثبت نام راننده تاکسی ۴۰۳۰',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      AppSpacing.largeVerticalSpacer,
      Text(
        'وسیله نقلیه خود را انتخاب کنید.',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  );

  Widget _items() => ListView.separated(
    itemCount: controller.vehicles.length,
    separatorBuilder: (_, __) => AppSpacing.xxLargeVerticalSpacer,
    itemBuilder: (_, final index) {
      final item = controller.vehicles[index];
      return VehicleCard(
        title: item.title,
        imagePath: item.imagePath,
        onTap: () => Get.toNamed(item.uriRoute),
      );
    },
  );
}
