import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../shared/widgets/page_bottom_button.dart';

class AuthGuideStep3Page extends StatelessWidget {
  const AuthGuideStep3Page({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'احراز هویت امنیتی',
    bodySubTitle:
        'گوشی باید به‌صورت کاملاً عمودی و بدون چرخش در دست نگه داشته شود تا چهره به‌درستی تشخیص داده شود.',
    bottomNavigationBar: PageBottomButton(
      label: 'ادامه',
      onTap: () => Get.toNamed(TaxiRouteNames.authGuideStep4.uri),
      isActive: true,
      isLoading: false,
    ),
    body: Column(
      children: [
        Image.asset(Assets.pngs.authGuideStep3.path,
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.contain),
      ],
    ),
  );
}
