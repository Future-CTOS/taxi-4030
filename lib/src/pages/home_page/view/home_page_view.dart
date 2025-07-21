import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/infrastructures/theme/spacing.dart';

import '../../../components/scaffold.dart';
import '../../../infrastructures/utils/utils.dart';
import '../controller/home_page_controller.dart';
import '../model/enum/trip_type_enum.dart';
import 'widgets/bottom_sheet_item.dart';
import 'widgets/trip_type_widget.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) =>
      CustomScaffold(pageTitle: '-', body: _body(context), showEndDrawer: true);

  Widget _body(BuildContext context) => Column(
    children: [
      _vipBox(context),
      Wrap(
        children: [
          ...TripTypeEnum.values.map(
            (e) => TripTypeWidget(
              icon: e.icon,
              title: e.title,
              onTap: controller.navigateToTripPage,
            ),
          ),
        ],
      ),
      SizedBox(height: 50),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Row(
            children: [
              Expanded(
                child: BottomSheetItem(
                  icon: CupertinoIcons.home,
                  isSelected: true,
                ),
              ),
              AppSpacing.mediumHorizontalSpacer,
              Expanded(child: BottomSheetItem(icon: CupertinoIcons.tag)),
              AppSpacing.mediumHorizontalSpacer,
              Expanded(child: BottomSheetItem(icon: CupertinoIcons.person)),
            ],
          ),
        ),
      ),
    ],
  );

  Widget _vipBox(BuildContext context) => GestureDetector(
    onTap: () => Utils.showInDevelopmentSnackBar(context),
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(AppSpacing.largeSpace)),
      ),
      height: 200,
      padding: AppSpacing.largePadding,
      margin: AppSpacing.largePadding,
      child: Placeholder(),
    ),
  );
}
