import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TripTypeEnum {
  taxi(icon: Icons.local_taxi, title: 'تاکسی'),
  personal(icon: CupertinoIcons.car, title: 'شخصی'),
  truck(icon: Icons.fire_truck, title: 'وانت'),
  bike(icon: Icons.pedal_bike, title: 'موتور');

  final String title;
  final IconData icon;

  const TripTypeEnum({required this.title, required this.icon});
}
