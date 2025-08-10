import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../../infrastructures/commons/repository_urls.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../models/dtos/driver_otp_verify_dto.dart';
import '../models/dtos/driver_register_dto.dart';
import '../models/view_models/driver_otp_verify_view_model.dart';

class DriverOtpVerifyRepository {
  Future<Either<String, DriverOtpVerifyViewModel>> verifyOtp({
    required DriverOtpVerifyDto dto,
  }) async {
    try {
      int? statusCode;

      final http.Response response = await http.post(
        RepositoryUrls.driverVerifyOtp,
        headers: Utils.headers,
        body: dto.toJson(),
      );
      final Map<String, dynamic> jsonData = json.decode(response.body);
      statusCode = response.statusCode;
      if (statusCode == 201) {
        final DriverOtpVerifyViewModel verifyViewModel =
            DriverOtpVerifyViewModel.fromJson(jsonData);
        return Right(verifyViewModel);
      } else {
        return const Left('کد اشتباه است');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Map<String, dynamic>>> requestOtp({
    required DriverRegisterDto dto,
  }) async {
    try {
      int? statusCode;
      final http.Response response = await http.post(
        RepositoryUrls.driverRequestOtp,
        headers: Utils.headers,
        body: dto.toJson(),
      );
      final Map<String, dynamic> jsonData = json.decode(response.body);
      statusCode = response.statusCode;
      if (statusCode == 201) {
        return Right(jsonData);
      } else {
        return const Left('failed to request otp');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
