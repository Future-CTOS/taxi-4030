import 'package:flutter/widgets.dart';
import '../../../components/drop_down.dart';

import '../../../components/number_text_field.dart';
import '../../../components/text_field.dart';
import '../../../infrastructures/utils/spacing.dart';
import '../../../infrastructures/utils/validators.dart';
import '../../shared/widgets/page_bottom_button.dart';

class VehicleOwnerDetailsView extends StatelessWidget {
  const VehicleOwnerDetailsView({
    super.key,
    required this.items,
    required this.initialValue,
    required this.firstNameController,
    required this.lastNameController,
    required this.fatherName,
    required this.nationalIdController,
    required this.title,
    required this.formKey,
    required this.showFormOnIndex,
    required this.isLoading,
    required this.isFormFilled,
    required this.onSubmit,
    required this.onChangeTitle,
    required this.selectedValue,
  });

  final List<String> items;
  final String title;
  final String initialValue;
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController fatherName;
  final TextEditingController nationalIdController;
  final int showFormOnIndex;
  final bool isLoading;
  final bool isFormFilled;
  final String selectedValue;
  final void Function() onSubmit;
  final void Function(String?) onChangeTitle;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        CustomDropDown(
          title: title,
          items: items,
          value: selectedValue,
          hint: selectedValue,
          defaultIcon: true,
          getTitle: (item) => item,
          onSelectItem: onChangeTitle,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _shouldShowForm(selectedValue) ? _form() : SizedBox.shrink(),
        ),
        if (!_shouldShowForm(selectedValue)) ...[
          SizedBox(height: MediaQuery.of(context).size.height * 0.4),
          PageBottomButton(
            label: 'ادامه',
            onTap: onSubmit,
            isActive: true,
            isLoading: isLoading,
            transparentBackground: true,
          ),
        ],
      ],
    ),
  );

  Widget _form() => Form(
    key: formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextField(
          label: 'نام',
          hint: 'نام خود را وارد کنید',
          textController: firstNameController,
        ),
        AppSpacing.largeVerticalSpacer,
        CustomTextField(
          label: 'نام خانوادگی',
          hint: 'نام خانوادگی خود را وارد کنید',
          textController: lastNameController,
        ),
        AppSpacing.largeVerticalSpacer,
        NumberTextField(
          controller: nationalIdController,
          hint: 'شماره شناسامه خود را وارد کنید',
          label: 'شماره شناسامه',
          validator: Validators.nationalIdValidator,
        ),
        AppSpacing.largeVerticalSpacer,
        CustomTextField(
          label: 'نام پدر',
          hint: 'نام پدر خود را وارد کنید',
          textController: fatherName,
        ),
        AppSpacing.largeVerticalSpacer,
        PageBottomButton(
          label: 'ادامه',
          onTap: isFormFilled ? onSubmit : () {},
          isActive: isFormFilled,
          isLoading: isLoading,
          transparentBackground: true,
        ),
        AppSpacing.largeVerticalSpacer,
      ],
    ),
  );

  bool _shouldShowForm(String value) {
    final int index = items.indexOf(value);
    return index == showFormOnIndex;
  }
}
