import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../shared/widgets/page_bottom_button.dart';

class AuthGuideStep4Page extends StatelessWidget {
  const AuthGuideStep4Page({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'احراز هویت امنیتی',
    bodySubTitle:
        'در محیطی با نور کافی قرار بگیرید. مطمئن شوید چهره شما کاملاً مشخص و تصویر دوربین واضح باشد.',
    bottomNavigationBar: PageBottomButton(
      label: 'ادامه',
      onTap: () => Get.toNamed(TaxiRouteNames.videoAuth.uri),
      isActive: true,
      isLoading: false,
    ),
    body: Column(
      children: [
        Image.asset(
          Assets.pngs.authGuideStep4.path,
          height: MediaQuery.of(context).size.height / 2,
          fit: BoxFit.contain,
        ),
      ],
    ),
  );
}
