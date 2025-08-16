import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../../infrastructures/commons/repository_urls.dart';
import '../../../../infrastructures/commons/token_info.dart';
import '../models/driver_personal_info_dto.dart';
import '../models/driver_register_view_model.dart';

class CarDriverRegisterRepository {
  Future<Either<String, DriverPersonalInfoViewModel>> userRegister({
    required DriverPersonalInfoDto dto,
  }) async {
    try {
      int? statusCode;
      final http.Response response = await http.post(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.driverPersonalInfo,
        body: dto.toJson(),
      );
      final Map<String, dynamic> jsonData = json.decode(response.body);
      print(jsonData);
      statusCode = response.statusCode;
      if (statusCode == 201) {
        final DriverPersonalInfoViewModel verifyViewModel =
            DriverPersonalInfoViewModel.fromJson(jsonData);
        print('is 201 : $jsonData');
        return Right(verifyViewModel);
      } else {
        return const Left('حطا');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
