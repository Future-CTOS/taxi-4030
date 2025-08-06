import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/components/scaffold.dart';

import '../../../../infrastructures/utils/constants.dart';
import '../../shared/video_auth_view.dart';
import '../controller/video_auth_controller.dart';

class VideoAuthPage extends GetView<VideoAuthController> {
  const VideoAuthPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'احراز هویت امنیتی',
    bodySubTitle: 'برای احراز هویت یک ویدیو با توضیحات زیر از خود بگیرید',
    bodyPadding: EdgeInsetsGeometry.symmetric(
      horizontal: Constants.horizontalPagePaddingSize,
    ),
    body: Obx(
      () => VideoAuthView(
        onContinueTap: controller.uploadInsuranceImage,
        isUploadLoading: controller.isUploadLoading.value,
        isActiveContinue: controller.isActiveContinue.value,
        onUploadButtonTap: controller.onUploadButtonTap,
        isLoading: controller.isLoading.value,
      ),
    ),
  );
}
