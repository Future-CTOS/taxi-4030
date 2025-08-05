import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../infrastructures/utils/constants.dart';
import '../infrastructures/utils/validators.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.textController,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: Theme.of(context).textTheme.bodyMedium),
      const SizedBox(height: 8),
      TextFormField(
        validator: validator ?? Validators.validateFirstName,
        controller: textController,
        style: Theme.of(context).textTheme.bodyMedium,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        inputFormatters:
            inputFormatters ??
            [FilteringTextInputFormatter.allow(RegExp(r'[آ-ی\s]'))],
        decoration: _inputDecoration(context: context, hintText: hint),
      ),
    ],
  );

  BorderRadius _borderRadius() =>
      BorderRadius.circular(Constants.textFiledRadius);

  InputDecoration _inputDecoration({
    required BuildContext context,
    required String hintText,
  }) => InputDecoration(
    hintText: hintText,
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
}
