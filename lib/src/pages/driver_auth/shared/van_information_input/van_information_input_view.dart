import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/scaffold.dart';
import 'package:taxi_4030/src/infrastructures/routes/route_names.dart';
import 'package:taxi_4030/src/pages/shared/widgets/page_bottom_button.dart';

import '../../../../components/drop_down.dart';

class VanInformationInputView extends StatelessWidget {
  const VanInformationInputView({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final items = ['الف', 'ب', 'ض'];
    return Column(
      children: [
        CustomDropDown(
          title: 'سسیستم و تیپ وانت',
          items: items,
          getTitle: (item) => 'ites',
          hint: 'سسیستم و تیپ وانت',
          value: null,
        ),
        CustomDropDown(
          title: 'مدل (سال تولید وانت)',
          items: items,
          getTitle: (item) => 'ites',
          hint: 'مدل (سال تولید وانت)',
          value: null,
        ),
        CustomDropDown(
          title: 'رنگ وانت',
          items: items,
          getTitle: (item) => 'ites',
          hint: 'رنگ وانت',
          value: null,
        ),
        CustomDropDown(
          title: 'حداکثر ظرفیت بار',
          items: items,
          getTitle: (item) => 'ites',
          hint: 'حداکثر ظرفیت بار',
          value: null,
        ),
        PageBottomButton(
          label: 'ادامه',
          onTap: onTap,
          isActive: true,
          isLoading: false,
        ),
      ],
    );
  }
}
