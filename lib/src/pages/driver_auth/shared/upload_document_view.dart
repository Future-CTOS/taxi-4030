import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';
import '../../../infrastructures/utils/utils.dart';
import 'widgets/upload_image_button.dart';

class UploadDocumentView extends StatefulWidget {
  final String frontEmptyImage;
  final String frontFilledImage;
  final String backEmptyImage;
  final String backFilledImage;
  final String frontLabel;
  final String backLabel;
  final bool isFrontLoading;
  final bool isBackLoading;
  final bool hasFrontFile;
  final bool hasBackFile;
  final VoidCallback onFrontTap;
  final VoidCallback onBackTap;

  const UploadDocumentView({
    super.key,
    required this.frontEmptyImage,
    required this.frontFilledImage,
    required this.backEmptyImage,
    required this.backFilledImage,
    required this.frontLabel,
    required this.backLabel,
    required this.isFrontLoading,
    required this.isBackLoading,
    required this.hasFrontFile,
    required this.hasBackFile,
    required this.onFrontTap,
    required this.onBackTap,
  });

  @override
  State<UploadDocumentView> createState() => _UploadDocumentViewState();
}

class _UploadDocumentViewState extends State<UploadDocumentView> {
  @override
  void initState() {
    Utils.showPermissionBottomSheet(
      context: context,
      requestCamera: true,
      requestStorage: true,
      requestMicrophone: true,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppSpacing.giantVerticalSpacer,
      _topSection(),
      AppSpacing.giantVerticalSpacer,
      _bottomSection(),
    ],
  );

  Widget _topSection() => UploadImageButton(
    label: widget.frontLabel,
    emptyImagePath: widget.frontEmptyImage,
    filledImagePath: widget.frontFilledImage,
    hasFile: widget.hasFrontFile,
    isLoading: widget.isFrontLoading,
    onTap: widget.onFrontTap,
  );

  Widget _bottomSection() => UploadImageButton(
    label: widget.backLabel,
    emptyImagePath: widget.backEmptyImage,
    filledImagePath: widget.backFilledImage,
    hasFile: widget.hasBackFile,
    isLoading: widget.isBackLoading,
    onTap: widget.onBackTap,
  );
}
