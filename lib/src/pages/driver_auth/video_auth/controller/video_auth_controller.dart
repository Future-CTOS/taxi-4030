import 'dart:io';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/foundation.dart';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../../shared/model/enum/status_enum.dart';
import '../repository/video_auth_repository.dart';

class VideoAuthController extends GetxController {
  final _repository = VideoAuthRepository();
  final RxBool isUploadLoading = false.obs;
  final RxBool isActiveContinue = false.obs;
  final RxBool isLoading = false.obs;

  Future<void> onUploadAuthVideo(BuildContext context) async {
    isLoading.value = true;
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickVideo(
      source: ImageSource.camera,
      maxDuration: Duration(minutes: 1),
      preferredCameraDevice: CameraDevice.front,
    );

    if (pickedFile == null) {
      isLoading.value = false;
      return;
    }

    final String? compressedPath = await _compressVideo(
      inputPath: pickedFile.path,
      // outputFileName: "auth_video.mp4",
      crf: 28,
      maxWidth: 720,
    );

    if (compressedPath == null) {
      isLoading.value = false;
      Utils.showSnackBar(
        context,
        text: "خطا در فشرده‌سازی ویدیو",
        status: StatusEnum.danger,
      );
      return;
    }

    final File compressedFile = File(compressedPath);
    final Uint8List bytes = await compressedFile.readAsBytes();

    final resultOrException = await _repository.uploadAuthVideo(
      bytes: bytes,
      file: pickedFile,
    );

    isLoading.value = false;
    resultOrException.fold(
      (error) =>
          Utils.showSnackBar(context, text: error, status: StatusEnum.danger),
      (response) {
        isActiveContinue.value = true;
        Utils.showSnackBar(
          context,
          text: response.message,
          status: StatusEnum.success,
        );
      },
    );
  }

  Future<String?> _compressVideo({
    required String inputPath,
    String? outputFileName,
    int crf = 28,
    int maxWidth = 720,
  }) async {
    try {
      String outputPath;
      if (kIsWeb) {
        outputPath = '/tmp/${outputFileName ?? "compressed.mp4"}';
      } else {
        final Directory tempDir = await getTemporaryDirectory();
        outputPath = path.join(
          tempDir.path,
          outputFileName ?? 'compressed.mp4',
        );
      }
      final Directory tempDir = await getTemporaryDirectory();
      final String fileName =
          outputFileName ?? 'compressed_${path.basename(inputPath)}';
      outputPath = path.join(tempDir.path, fileName);

      final String command =
          "-i '$inputPath' -vf 'scale=min($maxWidth\\,iw):-2' -c:v libx264 -crf $crf -preset fast -c:a aac -b:a 128k '$outputPath'";

      final session = await FFmpegKit.execute(command);

      final returnCode = await session.getReturnCode();
      if (ReturnCode.isSuccess(returnCode)) {
        return outputPath;
      } else {
        final logs = await session.getAllLogs();
        print("FFmpeg error logs:");
        logs.forEach((log) => print(log.getMessage()));
        return null;
      }
    } catch (e) {
      print("Error compressing video: $e");
      return null;
    }
  }

  void onContinueTap() {
    if (!isActiveContinue.value) return;
    Get.toNamed(TaxiRouteNames.authPending.uri);
  }
}
