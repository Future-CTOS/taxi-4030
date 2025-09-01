import 'package:flutter/material.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';

import 'loading.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.action,
    this.isDisable = false,
    this.isHalfSize,
  });

  final String label;
  final void Function() action;
  final bool? isDisable;
  final bool? isHalfSize;

  @override
  Widget build(BuildContext context) =>
      Padding(
        padding: AppSpacing.smallPadding,
        child: SizedBox(
          width: double.infinity,
          height: isHalfSize ?? false ? 35 : 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              textStyle: TextStyle(
                  fontSize: isHalfSize ?? false ? 15 : 20,
                  fontWeight: FontWeight.bold,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onPrimary
              ),
              elevation: AppSpacing.giantSpace,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.giantSpace),
              ),
            ),
            onPressed: isDisable! ? null : action,
            child: isDisable! ? const CustomLoading() : Text(label),
          ),
        ),
      );
}
