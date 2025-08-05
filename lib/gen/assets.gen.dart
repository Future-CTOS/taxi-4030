// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsPngsGen {
  const $AssetsPngsGen();

  /// File path: assets/pngs/auth_guide_step1.png
  AssetGenImage get authGuideStep1 =>
      const AssetGenImage('assets/pngs/auth_guide_step1.png');

  /// File path: assets/pngs/auth_guide_step2.png
  AssetGenImage get authGuideStep2 =>
      const AssetGenImage('assets/pngs/auth_guide_step2.png');

  /// File path: assets/pngs/auth_guide_step3.png
  AssetGenImage get authGuideStep3 =>
      const AssetGenImage('assets/pngs/auth_guide_step3.png');

  /// File path: assets/pngs/auth_guide_step4.png
  AssetGenImage get authGuideStep4 =>
      const AssetGenImage('assets/pngs/auth_guide_step4.png');

  /// File path: assets/pngs/auth_pending_image.png
  AssetGenImage get authPendingImage =>
      const AssetGenImage('assets/pngs/auth_pending_image.png');

  /// File path: assets/pngs/back_driving_licenses.png
  AssetGenImage get backDrivingLicenses =>
      const AssetGenImage('assets/pngs/back_driving_licenses.png');

  /// File path: assets/pngs/back_driving_licenses_filled.png
  AssetGenImage get backDrivingLicensesFilled =>
      const AssetGenImage('assets/pngs/back_driving_licenses_filled.png');

  /// File path: assets/pngs/back_van_card_upload.png
  AssetGenImage get backVanCardUpload =>
      const AssetGenImage('assets/pngs/back_van_card_upload.png');

  /// File path: assets/pngs/back_van_card_upload_filled.png
  AssetGenImage get backVanCardUploadFilled =>
      const AssetGenImage('assets/pngs/back_van_card_upload_filled.png');

  /// File path: assets/pngs/car.png
  AssetGenImage get car => const AssetGenImage('assets/pngs/car.png');

  /// File path: assets/pngs/car_2d.png
  AssetGenImage get car2d => const AssetGenImage('assets/pngs/car_2d.png');

  /// File path: assets/pngs/front_driving_licenses.png
  AssetGenImage get frontDrivingLicenses =>
      const AssetGenImage('assets/pngs/front_driving_licenses.png');

  /// File path: assets/pngs/front_driving_licenses_filled.png
  AssetGenImage get frontDrivingLicensesFilled =>
      const AssetGenImage('assets/pngs/front_driving_licenses_filled.png');

  /// File path: assets/pngs/front_van_card_upload.png
  AssetGenImage get frontVanCardUpload =>
      const AssetGenImage('assets/pngs/front_van_card_upload.png');

  /// File path: assets/pngs/front_van_card_upload_filled.png
  AssetGenImage get frontVanCardUploadFilled =>
      const AssetGenImage('assets/pngs/front_van_card_upload_filled.png');

  /// File path: assets/pngs/iranian_flag.png
  AssetGenImage get iranianFlag =>
      const AssetGenImage('assets/pngs/iranian_flag.png');

  /// File path: assets/pngs/motorcycle.png
  AssetGenImage get motorcycle =>
      const AssetGenImage('assets/pngs/motorcycle.png');

  /// File path: assets/pngs/motorcycle_2d.png
  AssetGenImage get motorcycle2d =>
      const AssetGenImage('assets/pngs/motorcycle_2d.png');

  /// File path: assets/pngs/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/pngs/profile.png');

  /// File path: assets/pngs/upload_image.png
  AssetGenImage get uploadImage =>
      const AssetGenImage('assets/pngs/upload_image.png');

  /// File path: assets/pngs/van.png
  AssetGenImage get van => const AssetGenImage('assets/pngs/van.png');

  /// File path: assets/pngs/van_2d.png
  AssetGenImage get van2d => const AssetGenImage('assets/pngs/van_2d.png');

  /// File path: assets/pngs/video_upload_image.png
  AssetGenImage get videoUploadImage =>
      const AssetGenImage('assets/pngs/video_upload_image.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    authGuideStep1,
    authGuideStep2,
    authGuideStep3,
    authGuideStep4,
    authPendingImage,
    backDrivingLicenses,
    backDrivingLicensesFilled,
    backVanCardUpload,
    backVanCardUploadFilled,
    car,
    car2d,
    frontDrivingLicenses,
    frontDrivingLicensesFilled,
    frontVanCardUpload,
    frontVanCardUploadFilled,
    iranianFlag,
    motorcycle,
    motorcycle2d,
    profile,
    uploadImage,
    van,
    van2d,
    videoUploadImage,
  ];
}

class Assets {
  const Assets._();

  static const AssetGenImage appLogo = AssetGenImage('assets/app_logo.png');
  static const $AssetsPngsGen pngs = $AssetsPngsGen();

  /// List of all assets
  static List<AssetGenImage> get values => [appLogo];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
