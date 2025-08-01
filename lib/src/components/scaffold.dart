import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/gen/assets.gen.dart';
import 'package:taxi_4030/src/infrastructures/routes/route_names.dart';
import 'package:taxi_4030/src/infrastructures/utils/constants.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';

import '../../generated/locales.g.dart';
import '../infrastructures/theme/theme_controller.dart';
import 'image_builder.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.title,
    this.appBarTitle,
    this.bottomNavigationBar,
    this.onRefresh,
    this.showEndDrawer,
    this.resizeToAvoidBottomInset,
    this.appBar,
    this.bodyPadding,
    this.bodyTitle,
    this.bodySubTitle,
    this.bottomSheet,
  });

  final String? title;
  final Widget? appBarTitle;
  final bool? showEndDrawer;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;
  final Future<void> Function()? onRefresh;
  final EdgeInsetsGeometry? bodyPadding;
  final String? bodyTitle;
  final String? bodySubTitle;

  final Widget body;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final bool canPop = Navigator.of(context).canPop();
    return Obx(() {
      final isDark = themeController.themeMode.value == ThemeMode.dark;
      return Scaffold(
        bottomSheet: bottomSheet != null
            ? Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: Constants.horizontalPagePaddingSize,
                  vertical: Constants.verticalPagePaddingSize,
                ),
                child: bottomSheet,
              )
            : null,
        endDrawer: showEndDrawer ?? false ? _endDrawerWidget(context) : null,
        appBar:
            appBar ?? _appBar(context, isDark, themeController, canPop: canPop),
        body: SafeArea(child: _body(context)),
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
          onTap: () => Get.offAllNamed(TaxiRouteNames.phoneInput.path),
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
    ThemeController themeController, {
    required bool canPop,
  }) => AppBar(
    backgroundColor: Theme.of(context).colorScheme.surface,
    automaticallyImplyLeading: false,
    actionsPadding: EdgeInsetsGeometry.symmetric(
      horizontal: AppSpacing.largeSpace,
    ),
    actions: [
      _logo(context),
      const Spacer(),
      if (canPop)
        IconButton(
          icon: Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () => Get.back(),
        )
      else
        IconButton(
          tooltip: 'Toggle Theme',
          icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
          onPressed: () => themeController.toggleTheme(),
        ),
      if (showEndDrawer ?? false) _endDrawerBuilder(),
    ],
    title: title != null ? Text(title!) : null,
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
        child: Padding(
          padding:
              bodyPadding ??
              EdgeInsetsGeometry.symmetric(
                horizontal: Constants.horizontalPagePaddingSize,
                vertical: Constants.verticalPagePaddingSize,
              ),
          child: bodyTitle != null && bodySubTitle != null
              ? Column(
                  children: [
                    Expanded(flex: 1, child: _headerContent(context)),
                    Expanded(flex: 3, child: body),
                  ],
                )
              : body,
        ),
      ),
    ),
  );

  Widget _headerContent(BuildContext context) => Column(
    children: [
      Text(bodyTitle!, style: Theme.of(context).textTheme.titleLarge),
      AppSpacing.largeVerticalSpacer,
      Text(
        bodySubTitle!,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  );

  Widget _logo(BuildContext context) => Row(
    children: [
      Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.appLogo.path)),
          shape: BoxShape.circle,
        ),
      ),
      AppSpacing.mediumHorizontalSpacer,
      Text('تاکسی 4030', style: Theme.of(context).textTheme.titleLarge),
    ],
  );
}
