import 'package:flutter/material.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    super.key,
    required this.icon,
    this.isSelected = false,
  });

  final IconData icon;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) => Container(
    height: double.infinity,
    width: double.infinity,
    decoration: _decoration(context),
    child: Icon(
      icon,
      color: isSelected! ? Theme.of(context).colorScheme.primary :Theme.of(context).colorScheme.secondary,
    ),
  );

  BoxDecoration _decoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(AppSpacing.largeSpace)),
      border: Border.all(color: Theme.of(context).colorScheme.primary),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Theme.of(context).colorScheme.surface.withValues(alpha: 0.05),
          Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.07),
        ],
        stops: [0.7, 0.95],
        tileMode: TileMode.decal,
      ),
    );
  }
}
