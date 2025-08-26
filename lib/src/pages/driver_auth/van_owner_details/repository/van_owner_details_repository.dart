import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../../infrastructures/commons/repository_urls.dart';
import '../../../../infrastructures/commons/token_info.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../models/dtos/van_owner_details_dto.dart';
import '../models/view_models/van_owner_details_view_model.dart';

class VanOwnerDetailsRepository {
  Future<Either<String, VanOwnerDetailsViewModel>> submitOwnerForOtherInfo({
    required VanOwnerDetailsDto dto,
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
        final VanOwnerDetailsViewModel verifyViewModel =
            VanOwnerDetailsViewModel.fromJson(jsonData);
        print('is 201 : $jsonData');
        return Right(verifyViewModel);
      } else {
        return const Left('خطا');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, VanOwnerDetailsViewModel>> submitOwnerForSelfInfo({
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
        final VanOwnerDetailsViewModel verifyViewModel =
            VanOwnerDetailsViewModel.fromJson(jsonData);
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
