import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/scaffold.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/shine_effect.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(body: _content(context));

  Widget _content(BuildContext context) =>
      Center(child: ShineEffect(child: _logo(context)));

  Widget _logo(BuildContext context) => SizedBox(
    height: context.height / 1.75,
    width: context.width / 1.75,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(flex: 2, child: Image.asset(Assets.appLogo.path)),
        SizedBox(height: 16),
        Expanded(flex: 1, child: Text('Taxi 4030')),
      ],
    ),
  );
}
