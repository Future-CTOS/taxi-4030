import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../shared/widgets/page_bottom_button.dart';

class AuthGuideStep2Page extends StatelessWidget {
  const AuthGuideStep2Page({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'احراز هویت امنیتی',
    bodySubTitle:
        'صورتتان را با فاصله مناسب از دوربین سلفی قرار دهید به‌گونه‌ای که در مرکز کادر مشخص‌شده قرار بگیرد.',
    bottomNavigationBar: PageBottomButton(
      label: 'ادامه',
      onTap: () => Get.toNamed(TaxiRouteNames.authGuideStep3.uri),
      isActive: true,
      isLoading: false,
    ),
    body: Column(
      children: [
        Image.asset(Assets.pngs.authGuideStep2.path,
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.contain),
      ],
    ),
  );
}
