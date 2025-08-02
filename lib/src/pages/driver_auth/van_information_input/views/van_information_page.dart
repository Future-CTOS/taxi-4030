import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/scaffold.dart';

import '../../../../infrastructures/routes/route_names.dart';
import '../../shared/van_information_input/van_information_input_view.dart';

class VanInformationPage extends StatelessWidget {
  const VanInformationPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'مشخصات وانت',
    bodySubTitle:
        'هر کدام از اطلاعات زیر با کارت وانت مغایرت دارد را اصلاح کنید.',
    body: SingleChildScrollView(
      child: Obx(
        () => VanInformationInputView(
          onTap: () {
            Get.toNamed(TaxiRouteNames.carOwnerDetails.uri);
          },
        ),
      ),
    ),
  );
}
