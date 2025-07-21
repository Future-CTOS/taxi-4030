import 'package:flutter/material.dart';

enum StatusEnum {
  success(color: Colors.green),
  danger(color: Colors.red);

  final Color color;

  const StatusEnum({required this.color});
}
