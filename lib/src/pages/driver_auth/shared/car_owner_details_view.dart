import 'package:flutter/widgets.dart';
import '../../../components/drop_down.dart';

import '../../../components/number_text_field.dart';
import '../../../components/text_field.dart';
import '../../../infrastructures/utils/spacing.dart';
import '../../../infrastructures/utils/validators.dart';
import '../../shared/widgets/page_bottom_button.dart';

class CarOwnerDetailsView extends StatefulWidget {
  const CarOwnerDetailsView({
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
    required this.onContinueTap,
    required this.isLoading,
    required this.isActiveContinueBottom,
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
  final void Function() onContinueTap;
  final bool isActiveContinueBottom;

  @override
  State<CarOwnerDetailsView> createState() => _CarOwnerDetailsViewState();
}

class _CarOwnerDetailsViewState extends State<CarOwnerDetailsView> {
  late String selectedValue;

  @override
  void initState() {
    selectedValue = widget.initialValue;
    super.initState();
  }

  String _onChangeTitle(String? value) {
    setState(() {
      selectedValue = value!;
    });
    return selectedValue;
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        CustomDropDown(
          title: widget.title,
          items: widget.items,
          value: selectedValue,
          hint: selectedValue,
          defaultIcon: true,
          getTitle: (item) => item,
          onSelectItem: _onChangeTitle,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _shouldShowForm(selectedValue) ? _form() : SizedBox.shrink(),
        ),
      ],
    ),
  );

  Widget _form() => Form(
    key: widget.formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextField(
          label: 'نام',
          hint: 'نام خود را وارد کنید',
          textController: widget.firstNameController,
        ),
        AppSpacing.largeVerticalSpacer,
        CustomTextField(
          label: 'نام خانوادگی',
          hint: 'نام خانوادگی خود را وارد کنید',
          textController: widget.lastNameController,
        ),
        AppSpacing.largeVerticalSpacer,
        NumberTextField(
          controller: widget.nationalIdController,
          hint: 'شماره شناسامه خود را وارد کنید',
          label: 'شماره شناسامه',
          validator: Validators.nationalIdValidator,
        ),
        AppSpacing.largeVerticalSpacer,
        CustomTextField(
          label: 'نام پدر',
          hint: 'نام پدر خود را وارد کنید',
          textController: widget.fatherName,
        ),
        AppSpacing.giantVerticalSpacer,
        PageBottomButton(
          label: 'ادامه',
          onTap: widget.onContinueTap,
          isActive: widget.isActiveContinueBottom,
          isLoading: widget.isLoading,
        ),
        AppSpacing.giantVerticalSpacer,
      ],
    ),
  );

  bool _shouldShowForm(String value) {
    final int index = widget.items.indexOf(value);
    return index == widget.showFormOnIndex;
  }
}
