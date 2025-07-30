import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';

import '../infrastructures/utils/constants.dart';

class BirthDateField extends StatefulWidget {
  final TextEditingController dayController;
  final TextEditingController monthController;
  final TextEditingController yearController;
  final String label;

  const BirthDateField({
    super.key,
    required this.dayController,
    required this.monthController,
    required this.yearController,
    this.label = 'تاریخ تولد',
  });

  @override
  State<BirthDateField> createState() => _BirthDateFieldState();
}

class _BirthDateFieldState extends State<BirthDateField> {
  late final FocusNode _dayFocus;
  late final FocusNode _monthFocus;
  late final FocusNode _yearFocus;

  @override
  void initState() {
    super.initState();
    _dayFocus = FocusNode();
    _monthFocus = FocusNode();
    _yearFocus = FocusNode();
  }

  @override
  void dispose() {
    _dayFocus.dispose();
    _monthFocus.dispose();
    _yearFocus.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(BuildContext context, String hint) =>
      InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.textFiledRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.textFiledRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSecondary,
            width: 1,
          ),
        ),
      );

  Widget _dateBox({
    required BuildContext context,
    required TextEditingController controller,
    required FocusNode currentFocus,
    required FocusNode? nextFocus,
    required String hint,
    required int maxLength,
  }) => Padding(
    padding: AppSpacing.mediumPadding,
    child: SizedBox(
      width: maxLength == 4 ? 70 : 50,
      child: TextFormField(
        controller: controller,
        focusNode: currentFocus,
        maxLength: maxLength,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.bodyMedium,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(maxLength),
        ],
        onChanged: (val) {
          if (val.length == maxLength && nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
        decoration: _inputDecoration(context, hint).copyWith(counterText: ''),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(widget.label, style: Theme.of(context).textTheme.bodyMedium),
      const SizedBox(height: 8),
      Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _dateBox(
            context: context,
            controller: widget.yearController,
            currentFocus: _yearFocus,
            nextFocus: _monthFocus,
            hint: '1360',
            maxLength: 4,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('/'),
          ),
          _dateBox(
            context: context,
            controller: widget.monthController,
            currentFocus: _monthFocus,
            nextFocus: _dayFocus,
            hint: '02',
            maxLength: 2,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('/'),
          ),
          _dateBox(
            context: context,
            controller: widget.dayController,
            currentFocus: _dayFocus,
            nextFocus: null,
            hint: '22',
            maxLength: 2,
          ),
        ],
      ),
    ],
  );
}
