import 'package:flutter/material.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';

import '../../../components/drop_down.dart';
import '../../shared/widgets/page_bottom_button.dart';
import 'widgets/iranian_plate.dart';

class VanInformationInputView extends StatelessWidget {
  const VanInformationInputView({
    super.key,
    required this.onContinueTap,
    required this.onCompletedIranianPlate,
    required this.iranLicenseLetters,
    required this.selectedLetter,
    required this.isActiveContinueBottom,
    required this.isLoading,
  });

  final void Function(String?)? onCompletedIranianPlate;
  final void Function() onContinueTap;
  final List<String> iranLicenseLetters;
  final String? selectedLetter;
  final bool isActiveContinueBottom;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        IranianPlate(
          letters: iranLicenseLetters,
          selectedLetter: selectedLetter,
          onCompleted: onCompletedIranianPlate,
        ),
        CustomDropDown(
          title: 'سیستم و تیپ وانت',
          items: [],
          getTitle: (item) => 'ites',
          hint: 'سیستم و تیپ وانت',
          value: null,
        ),
        CustomDropDown(
          title: 'مدل (سال تولید وانت)',
          items: [],
          getTitle: (item) => 'ites',
          hint: 'مدل (سال تولید وانت)',
          value: null,
        ),
        CustomDropDown(
          title: 'رنگ وانت',
          items: [],
          getTitle: (item) => 'ites',
          hint: 'رنگ وانت',
          value: null,
        ),
        CustomDropDown(
          title: 'حداکثر ظرفیت بار',
          items: [],
          getTitle: (item) => 'ites',
          hint: 'حداکثر ظرفیت بار',
          value: null,
        ),
        AppSpacing.giantVerticalSpacer,
        PageBottomButton(
          label: 'ادامه',
          onTap: onContinueTap,
          isActive: isActiveContinueBottom,
          isLoading: isLoading,
        ),
        AppSpacing.giantVerticalSpacer,
      ],
    ),
  );
}
