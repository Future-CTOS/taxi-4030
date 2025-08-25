import 'dart:convert';

import 'package:either_dart/either.dart';

import '../../../../infrastructures/commons/repository_urls.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../models/van_register_dto.dart';
import 'package:http/http.dart' as http;

class VanDriverRepository {
  Future<Either<String, Map<String, dynamic>>> requestOtp({
    required VanRegisterDto dto,
  }) async {
    try {
      int? statusCode;
      final String body = json.encode(dto.toJson());
      final http.Response response = await http.post(
        RepositoryUrls.driverRequestOtp,
        headers: Utils.headers,
        body: body,
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
