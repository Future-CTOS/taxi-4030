import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../../shared/upload_document_view.dart';
import '../controller/van_card_upload_controller.dart';

class VanCardUploadPage extends GetView<VanCardUploadController> {
  const VanCardUploadPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'تصویر کارت وانت',
    bodySubTitle: 'عکس پشت و روی کارت وانت را بارگذاری کنید.',
    bodyPadding: EdgeInsets.only(
      right: Constants.horizontalPagePaddingSize,
      left: Constants.horizontalPagePaddingSize,
      bottom: Constants.verticalPagePaddingSize,
    ),
    bottomNavigationBar: Obx(
      () => PageBottomButton(
        label: 'ادامه',
        onTap: controller.submitUserInfo,
        isActive: controller.isCompletedInfo.value,
        isLoading: controller.isSubmitLoading.value,
      ),
    ),
    body: Obx(
      () => UploadDocumentView(
        frontEmptyImage: Assets.pngs.frontVanCardUpload.path,
        frontFilledImage: Assets.pngs.frontVanCardUploadFilled.path,
        backEmptyImage: Assets.pngs.backVanCardUpload.path,
        backFilledImage: Assets.pngs.backVanCardUploadFilled.path,
        frontLabel: 'تصویر روی کارت وانت',
        backLabel: 'تصویر پشت کارت وانت',
        isFrontLoading: controller.frontImageModel.value.isLoading,
        isBackLoading: controller.backImageModel.value.isLoading,
        hasFrontFile: controller.frontImageModel.value.file != null,
        hasBackFile: controller.backImageModel.value.file != null,
        onFrontTap: () => controller.pickImage(isFrontImage: true),
        onBackTap: () => controller.pickImage(isFrontImage: false),
      ),
    ),
  );
}
