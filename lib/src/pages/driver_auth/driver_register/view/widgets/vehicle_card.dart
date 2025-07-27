import 'package:flutter/material.dart';

import '../../../../../infrastructures/utils/constants.dart';
import '../../../../../infrastructures/utils/spacing.dart';

class VehicleCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const VehicleCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(Constants.shapeRadius),
    child: Container(
      padding: AppSpacing.largePadding,
      decoration: _decoration(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black87,
                radius: 16,
                child: Icon(Icons.add, color: Colors.white, size: 18),
              ),
              AppSpacing.mediumHorizontalSpacer,
              Text(title, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          AppSpacing.mediumHorizontalSpacer,
          Image.asset(imagePath, fit: BoxFit.contain),
        ],
      ),
    ),
  );

  BoxDecoration _decoration(BuildContext context) => BoxDecoration(
    color: Theme.of(context).colorScheme.surfaceContainer,
    borderRadius: BorderRadius.circular(Constants.shapeRadius),
  );
}
