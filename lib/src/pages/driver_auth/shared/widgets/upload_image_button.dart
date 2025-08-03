import 'package:flutter/material.dart';

import '../../../../components/loading.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../../infrastructures/utils/spacing.dart';

class UploadImageButton extends StatelessWidget {
  final String label;
  final String emptyImagePath;
  final String filledImagePath;
  final bool hasFile;
  final bool isLoading;
  final VoidCallback onTap;

  const UploadImageButton({
    super.key,
    required this.label,
    required this.emptyImagePath,
    required this.filledImagePath,
    required this.hasFile,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Image.asset(
        hasFile ? filledImagePath : emptyImagePath,
        fit: BoxFit.contain,
      ),
      AppSpacing.largeVerticalSpacer,
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
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
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            if (isLoading) ...[
              AppSpacing.smallHorizontalSpacer,
              const SizedBox(width: 20, height: 20, child: CustomLoading()),
            ],
          ],
        ),
      ),
    ],
  );
}
