import 'package:flutter/material.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';

class TripTypeWidget extends StatelessWidget {
  const TripTypeWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: _decoration(context),
      height: 100,
      width: 150,
      padding: AppSpacing.mediumPadding,
      margin: AppSpacing.mediumPadding,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Icon(
              icon,
              size: AppSpacing.giantSpace,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          AppSpacing.mediumVerticalSpacer,
          Expanded(
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ),
  );

  BoxDecoration _decoration(BuildContext context) => BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(AppSpacing.largeSpace)),
    border: Border.all(color: Theme.of(context).colorScheme.primary),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Theme.of(context).colorScheme.surface.withValues(alpha: 0.05),
        Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.05),
      ],
      stops: [0.7, 0.95],
      tileMode: TileMode.decal,
    ),
  );
}
