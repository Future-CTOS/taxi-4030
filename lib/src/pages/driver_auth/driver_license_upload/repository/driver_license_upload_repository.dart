import 'dart:convert';
import 'dart:typed_data';

import 'package:either_dart/either.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_4030/src/infrastructures/app_controller/app_controller.dart';
import '../../../../infrastructures/commons/repository_urls.dart';
import 'package:http/http.dart' as http;
import '../model/view_models/driver_license_upload_view_model.dart';

class DriverLicenseUploadRepository {
  Future<Either<String, DriverLicenseUploadViewModel>> uploadLicenseFront({
    required Uint8List bytes,
    required XFile file,
  }) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        RepositoryUrls.driverLicenseUploadFront,
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
          'licenseFront',
          bytes,
          contentType: MediaType('image', mimeType),
          filename: file.name.split('/').last,
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

  Future<Either<String, DriverLicenseUploadViewModel>> uploadLicenseBack({
    required Uint8List bytes,
    required XFile file,
  }) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        RepositoryUrls.driverLicenseUploadFront,
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
          'licenseBack',
          bytes,
          contentType: MediaType('image', mimeType),
          filename: file.name.split('/').last,
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
      print('Error: ${e.toString()}');
      return Left(e.toString());
    }
  }
}
