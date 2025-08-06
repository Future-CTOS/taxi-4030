import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../shared/widgets/page_bottom_button.dart';

class AuthGuideStep1Page extends StatelessWidget {
  const AuthGuideStep1Page({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'احراز هویت امنیتی',
    bodySubTitle:
        'برای تکمیل ثبت نام در تاکسی 4030 و تضمین امنیت \nشما, نیاز است یک ویدیو کوتاه ظبط کنید تا هویت شما تایید شود.',
    bottomNavigationBar: PageBottomButton(
      label: 'ادامه',
      onTap: () => Get.toNamed(TaxiRouteNames.authGuideStep2.uri),
      isActive: true,
      isLoading: false,
    ),
    body: Column(
      children: [
        Image.asset(
          Assets.pngs.authGuideStep1.path,
          height: MediaQuery.of(context).size.height / 2,
          fit: BoxFit.contain,
        ),
      ],
    ),
  );
}
