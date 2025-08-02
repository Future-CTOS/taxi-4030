import 'package:flutter/material.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import 'widgets/upload_image_button.dart';

class UploadDocumentPage extends StatelessWidget {
  final String frontEmptyImage;
  final String frontFilledImage;
  final String backEmptyImage;
  final String backFilledImage;
  final String frontLabel;
  final String backLabel;
  final bool isFrontLoading;
  final bool isBackLoading;
  final bool isSubmitLoading;
  final bool isSubmitEnabled;
  final bool hasFrontFile;
  final bool hasBackFile;
  final VoidCallback onFrontTap;
  final VoidCallback onBackTap;
  final VoidCallback onSubmit;

  const UploadDocumentPage({
    super.key,
    required this.frontEmptyImage,
    required this.frontFilledImage,
    required this.backEmptyImage,
    required this.backFilledImage,
    required this.frontLabel,
    required this.backLabel,
    required this.isFrontLoading,
    required this.isBackLoading,
    required this.isSubmitLoading,
    required this.isSubmitEnabled,
    required this.hasFrontFile,
    required this.hasBackFile,
    required this.onFrontTap,
    required this.onBackTap,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _topSection(),
      const Spacer(),
      _bottomSection(),
      const Spacer(),
      PageBottomButton(
        label: 'ادامه',
        onTap: onSubmit,
        isActive: isSubmitEnabled,
        isLoading: isSubmitLoading,
      ),
    ],
  );

  Widget _topSection() => UploadImageButton(
    label: frontLabel,
    emptyImagePath: frontEmptyImage,
    filledImagePath: frontFilledImage,
    hasFile: hasFrontFile,
    isLoading: isFrontLoading,
    onTap: onFrontTap,
  );

  Widget _bottomSection() => UploadImageButton(
    label: backLabel,
    emptyImagePath: backEmptyImage,
    filledImagePath: backFilledImage,
    hasFile: hasBackFile,
    isLoading: isBackLoading,
    onTap: onBackTap,
  );
}
