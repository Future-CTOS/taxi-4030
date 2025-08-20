import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../../infrastructures/commons/repository_urls.dart';
import '../../../../infrastructures/commons/token_info.dart';
import '../models/dtos/car_owner_details_dto.dart';
import '../models/car_owner_details_view_model.dart';

class CarOwnerDetailsRepository {
  Future<Either<String, CarOwnerDetailsViewModel>> submitOwnerForOtherInfo({
    required CarOwnerDetailsDto dto,
  }) async {
    try {
      int? statusCode;
      final http.Response response = await http.post(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.submitOwnerInfo,
        body: dto.toJson(),
      );
      print(response.body);
      final Map<String, dynamic> jsonData = json.decode(response.body);
      statusCode = response.statusCode;
      if (statusCode == 201) {
        final CarOwnerDetailsViewModel verifyViewModel =
            CarOwnerDetailsViewModel.fromJson(jsonData);
        print('is 201 : $jsonData');
        return Right(verifyViewModel);
      } else {
        return const Left('خطا');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CarOwnerDetailsViewModel>> submitOwnerForSelfInfo({
    required Map<String, dynamic> dto,
  }) async {
    try {
      int? statusCode;
      final http.Response response = await http.post(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.submitOwnerInfo,
        body: dto,
      );
      print(response.body);
      final Map<String, dynamic> jsonData = json.decode(response.body);
      statusCode = response.statusCode;
      if (statusCode == 201) {
        final CarOwnerDetailsViewModel verifyViewModel =
            CarOwnerDetailsViewModel.fromJson(jsonData);
        print('is 201 : $jsonData');
        return Right(verifyViewModel);
      } else {
        return const Left('خطا');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
