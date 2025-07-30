import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../infrastructures/utils/constants.dart';

class NumberTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String hint;
  final String? Function(String?)? validator;

  const NumberTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hint,
    this.label,
  });

  BorderRadius _borderRadius() =>
      BorderRadius.circular(Constants.textFiledRadius);

  InputDecoration _inputDecoration(BuildContext context) => InputDecoration(
    hintText: hint,
    hintStyle: Theme.of(context).textTheme.bodyMedium,
    focusedBorder: OutlineInputBorder(
      borderRadius: _borderRadius(),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: _borderRadius(),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 1,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: _borderRadius(),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSecondary,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(borderRadius: _borderRadius()),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: _borderRadius(),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
        width: 1,
      ),
    ),
    border: const OutlineInputBorder(),
  );

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (label != null) ...[
        Text(label!, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
      ],
      TextFormField(
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Theme.of(context).textTheme.bodyMedium,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
        decoration: _inputDecoration(context),
      ),
    ],
  );
}
