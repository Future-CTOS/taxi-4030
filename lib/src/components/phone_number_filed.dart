import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController textController;
  final String countryCode;
  final String hint;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final double countryCodeWidth;
  final bool isHighlighted;

  const PhoneNumberField({
    super.key,
    required this.textController,
    this.countryCode = '98+',
    this.hint = '9999999999',
    this.validator,
    this.onChange,
    this.countryCodeWidth = 70,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: TextFormField(
            validator: validator,
            controller: textController,
            autovalidateMode: AutovalidateMode.onUnfocus,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isHighlighted
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.secondary,
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            decoration: _inputDecoration(
              context: context,
              hintText: hint,
              highlighted: isHighlighted,
              theme: theme,
            ),
            onChanged: onChange,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: countryCodeWidth,
          height: 48,
          child: TextField(
            enabled: false,
            textAlign: TextAlign.center,
            decoration:
                _inputDecoration(
                  context: context,
                  hintText: countryCode,
                  highlighted: isHighlighted,
                  theme: theme,
                ).copyWith(
                  hintStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: isHighlighted
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.secondary,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: _borderRadius(),
                    borderSide: BorderSide(
                      color: isHighlighted
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.secondary,
                      width: 1,
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration({
    required BuildContext context,
    required String hintText,
    required bool highlighted,
    required ThemeData theme,
  }) => InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: theme.textTheme.bodyMedium?.copyWith(
      color: isHighlighted
          ? theme.colorScheme.onPrimary
          : theme.colorScheme.secondary,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: _borderRadius(),
      borderSide: BorderSide(
        color: highlighted
            ? theme.colorScheme.onSecondary
            : theme.colorScheme.secondary,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: _borderRadius(),
      borderSide: BorderSide(
        color: highlighted
            ? theme.colorScheme.onSecondary
            : theme.colorScheme.secondary,
        width: 1,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: _borderRadius(),
      borderSide: BorderSide(color: theme.colorScheme.onSecondary, width: 1),
    ),
    errorBorder: OutlineInputBorder(borderRadius: _borderRadius()),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: _borderRadius(),
      borderSide: BorderSide(color: theme.colorScheme.error, width: 1),
    ),
    border: const OutlineInputBorder(),
  );

  BorderRadius _borderRadius() => BorderRadius.circular(8);
}
