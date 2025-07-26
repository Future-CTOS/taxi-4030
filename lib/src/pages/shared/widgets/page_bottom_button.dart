import 'package:flutter/material.dart';
import 'package:taxi_4030/src/components/loading.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';

import '../../../infrastructures/utils/constants.dart';

class PageBottomButton extends StatelessWidget {
  const PageBottomButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.isActive,
    this.isLoading = false,
  });

  final bool isActive;
  final VoidCallback onTap;
  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.shapeRadius),
        ),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isActive
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          if (isLoading) ...[
            AppSpacing.smallHorizontalSpacer,
            SizedBox(
              width: 20,
              height: 20,
              child: isLoading
                  ? const CustomLoading()
                  : const SizedBox.shrink(),
            ),
          ],
        ],
      ),
    ),
  );
}
