import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/infrastructures/routes/route_names.dart';
import 'package:taxi_4030/src/infrastructures/theme/spacing.dart';

import '../../generated/locales.g.dart';
import '../infrastructures/theme/theme_controller.dart';
import 'image_builder.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.pageTitle,
    required this.body,
    this.bottomNavigationBar,
    this.onBackTap,
    this.onRefresh,
    this.showEndDrawer,
    this.resizeToAvoidBottomInset,
    this.appBar,
  });

  final String pageTitle;
  final bool? showEndDrawer;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;

  final Function()? onBackTap;
  final Future<void> Function()? onRefresh;

  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Obx(() {
      final isDark = themeController.themeMode.value == ThemeMode.dark;
      return Scaffold(
        endDrawer: showEndDrawer ?? false ? _endDrawerWidget(context) : null,
        appBar: appBar ?? _appBar(context, isDark, themeController),
        body: _body(context),
        bottomNavigationBar: bottomNavigationBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      );
    });
  }

  Widget _endDrawerWidget(BuildContext context) => Drawer(
    backgroundColor: Theme.of(context).colorScheme.surface,
    child: Column(
      children: [
        _header(),
        Expanded(child: _menuItems()),
        _logout(),
      ],
    ),
  );

  Widget _logout() => Padding(
    padding: const EdgeInsets.only(bottom: AppSpacing.largeSpace),
    child: Column(
      children: [
        const Divider(),
        AppSpacing.mediumVerticalSpacer,
        InkWell(
          onTap: () => Get.offAllNamed(TaxiRouteNames.loginPage.path),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.logout_outlined, color: Colors.white),
              AppSpacing.mediumHorizontalSpacer,
              Text(LocaleKeys.taxi_4030_app_shared_log_out.tr),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _menuItems() =>
      Column(children: [_notification(), _setting(), _aboutUs(), _contactUs()]);

  Widget _contactUs() => ListTile(
    title: Center(child: Text(LocaleKeys.taxi_4030_app_shared_contact_us.tr)),
    onTap: () => print("Get.toNamed(TaxiRouteNames.contactUs.uri)"),
  );

  Widget _aboutUs() => ListTile(
    title: Center(child: Text(LocaleKeys.taxi_4030_app_shared_about_us.tr)),
    onTap: () => print("Get.toNamed(TaxiRouteNames.aboutUs.uri)"),
  );

  Widget _setting() => ListTile(
    title: Center(child: Text(LocaleKeys.taxi_4030_app_shared_settings.tr)),
    onTap: () => print("Get.toNamed(TaxiRouteNames.settings.uri)"),
  );

  Widget _notification() => ListTile(
    title: Center(child: Text(LocaleKeys.taxi_4030_app_shared_notification.tr)),
    onTap: () => print("Get.toNamed(TaxiRouteNames.notification.uri)"),
  );

  Widget _header() => Padding(
    padding: const EdgeInsets.only(top: AppSpacing.giantSpace),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _avatar(),
        AppSpacing.mediumVerticalSpacer,
        _name(),
        AppSpacing.largeVerticalSpacer,
        const Divider(),
      ],
    ),
  );

  Widget _name() => Text("-");

  Widget _avatar() => CustomImageBuilder(
    image: 'profile.jpg',
    folder: 'profile',
    width: 100,
    height: 100,
    isAvatar: true,
  );

  AppBar _appBar(
    BuildContext context,
    bool isDark,
    ThemeController themeController,
  ) => AppBar(
    backgroundColor: Theme.of(context).colorScheme.surface,
    automaticallyImplyLeading: false,
    leading: onBackTap != null
        ? IconButton(
            onPressed: onBackTap!,
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          )
        : null,
    actions: [
      IconButton(
        tooltip: 'Toggle Theme',
        icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
        onPressed: () => themeController.toggleTheme(),
      ),
      if (showEndDrawer ?? false) _endDrawerBuilder(),
    ],
    title: Text(pageTitle),
    centerTitle: true,
  );

  Widget _endDrawerBuilder() => Builder(
    builder: (BuildContext context) => IconButton(
      icon: Icon(Icons.settings, color: Theme.of(context).colorScheme.primary),
      onPressed: () => Scaffold.of(context).openEndDrawer(),
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    ),
  );

  Widget _body(BuildContext context) => onRefresh == null
      ? _mainBody(context)
      : RefreshIndicator(
          color: Colors.red,
          edgeOffset: 10,
          displacement: 50,
          onRefresh: onRefresh!,
          child: _mainBody(context),
        );

  Widget _mainBody(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
    child: LayoutBuilder(
      builder: (context, constraints) => Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: math.min(600, constraints.maxWidth),
          ),
          child: body,
        ),
      ),
    ),
  );
}
