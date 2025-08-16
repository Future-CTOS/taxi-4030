import 'dart:convert';

import 'package:either_dart/either.dart';

import '../../../../infrastructures/commons/repository_urls.dart';
import '../../../../infrastructures/commons/token_info.dart';
import 'package:http/http.dart' as http;

import '../models/driver_activity_info_dto.dart';
import '../models/driver_activity_info_view_model.dart';

class DriverActivityInfoRepository {
  Future<Either<String, DriverActivityInfoViewModel>> userRegister({
    required DriverPersonalInfoDto dto,
  }) async {
    try {
      int? statusCode;
      final http.Response response = await http.post(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.driverActivityInfo,
        body: dto.toJson(),
      );
      final Map<String, dynamic> jsonData = json.decode(response.body);
      statusCode = response.statusCode;
      if (statusCode == 201) {
        DriverActivityInfoViewModel driverActivityInfoViewModel =
            DriverActivityInfoViewModel.fromJson(jsonData);
        return Right(driverActivityInfoViewModel);
      } else {
        return const Left('حطا');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
