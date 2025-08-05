import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'generated/locales.g.dart';
import 'src/infrastructures/routes/route_names.dart';
import 'src/infrastructures/routes/route_pages.dart';
import 'src/infrastructures/theme/app_theme.dart';
import 'src/infrastructures/theme/theme_controller.dart';

class TaxiApp extends StatelessWidget {
  TaxiApp({super.key});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) => Obx(
    () => GetMaterialApp(
      getPages: [...TaxiAppPages.routes],
      initialRoute: TaxiRouteNames.vehicleSelection.uri,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.themeMode.value,
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),
      translationsKeys: const {'fa_IR': Locales.fa_IR},
    ),
  );
}
