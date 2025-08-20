import 'dart:convert';
import 'dart:typed_data';

import 'package:either_dart/either.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../infrastructures/app_controller/app_controller.dart';
import '../../../../infrastructures/commons/repository_urls.dart';
import '../../driver_license_upload/model/view_models/driver_license_upload_view_model.dart';
import 'package:http/http.dart' as http;

class MotorcycleCardUploadRepository {
  Future<Either<String, DriverLicenseUploadViewModel>> uploadCardFront({
    required Uint8List bytes,
    required XFile file,
  }) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        RepositoryUrls.driverUploadCarCardFront,
      );

      request.headers['Authorization'] =
          'Bearer ${AppController.instance.driverToken}';

      final ext = file.name.split('.').last.toLowerCase();
      String mimeType;
      switch (ext) {
        case 'jpg':
        case 'jpeg':
          mimeType = 'jpeg';
          break;
        case 'png':
          mimeType = 'png';
          break;
        case 'webp':
          mimeType = 'webp';
          break;
        default:
          mimeType = 'jpeg';
      }

      request.files.add(
        http.MultipartFile.fromBytes(
          'carCardFront',
          bytes,
          contentType: MediaType('image', mimeType),
          filename: 'example.jpg',
        ),
      );

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      print('Response status: ${response.statusCode}');
      print('Response body: $responseBody');

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
      print('Error: ${e.toString()}');
      return Left(e.toString());
    }
  }

  Future<Either<String, DriverLicenseUploadViewModel>> uploadCardBack({
    required Uint8List bytes,
    required XFile file,
  }) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        RepositoryUrls.driverUploadCarCardBack,
      );

      request.headers['Authorization'] =
          'Bearer ${AppController.instance.driverToken}';

      final ext = file.name.split('.').last.toLowerCase();
      String mimeType;
      switch (ext) {
        case 'jpg':
        case 'jpeg':
          mimeType = 'jpeg';
          break;
        case 'png':
          mimeType = 'png';
          break;
        case 'webp':
          mimeType = 'webp';
          break;
        default:
          mimeType = 'jpeg';
      }

      request.files.add(
        http.MultipartFile.fromBytes(
          'carCardBack',
          bytes,
          contentType: MediaType('image', mimeType),
          filename: 'example.jpg',
        ),
      );
      print('Uploading: ${file.name}');
      print('Field: Size: ${bytes.lengthInBytes}');

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
      print('Error: ${e.toString()}');
      return Left(e.toString());
    }
  }
}
