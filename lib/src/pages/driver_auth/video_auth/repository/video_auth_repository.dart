import 'dart:convert';
import 'dart:typed_data';

import 'package:either_dart/either.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../infrastructures/app_controller/app_controller.dart';
import '../../../../infrastructures/commons/repository_urls.dart';
import 'package:http/http.dart' as http;
import '../../driver_license_upload/model/view_models/driver_license_upload_view_model.dart';

class VideoAuthRepository {
  Future<Either<String, DriverLicenseUploadViewModel>> uploadAuthVideo({
    required Uint8List bytes,
    required XFile file,
  }) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        RepositoryUrls.driverVideoUpload,
      );

      request.headers['Authorization'] =
          'Bearer ${AppController.instance.driverToken}';

      final ext = file.name.split('.').last.toLowerCase();
      String? mimeType;
      switch (ext) {
        case 'mp4':
        case 'mov':
        case 'avi':
        case 'mkv':
        case 'webm':
          mimeType = ext;
          break;
        default:
          mimeType = null;
          break;
      }

      if (mimeType == null) {
        return Left('فرمت ویدیو پشتیبانی نمیشود.');
      }

      request.files.add(
        http.MultipartFile.fromBytes(
          'video',
          bytes,
          contentType: MediaType('video', mimeType),
          // filename: 'example.jpg',
        ),
      );

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      if (response.statusCode == 201) {
        final Map<String, dynamic> jsonData = json.decode(responseBody);
        final driverActivityInfoViewModel =
            DriverLicenseUploadViewModel.fromJson(jsonData);
        return Right(driverActivityInfoViewModel);
      } else {
        return Left(
          'خطا در آپلود فایل: ${response.statusCode} => $responseBody',
        );
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
