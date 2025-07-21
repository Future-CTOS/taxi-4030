import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    this.value,
    super.key,
  });

  final double? value;

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(
          value: value,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white70),
        ),
      );
}
