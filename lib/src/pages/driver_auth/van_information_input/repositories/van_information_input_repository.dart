import 'dart:convert';

import 'package:either_dart/either.dart';
import '../../../../infrastructures/commons/repository_urls.dart';
import 'package:http/http.dart' as http;

import '../../../../infrastructures/commons/token_info.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../models/dtos/van_information_input_dto.dart';
import '../models/view_models/van_information_input_view_model.dart';

class VanInformationInputRepository {
  Future<Either<String, VanInformationInputViewModel>> fetchVanOptions() async {
    try {
      int? statusCode;
      final http.Response response = await http.get(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.driverGetVanInfo,
      );
      final Map<String, dynamic> jsonData = json.decode(response.body);
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final VanInformationInputViewModel viewModel =
            VanInformationInputViewModel.fromJson(jsonData);
        return Right(viewModel);
      } else {
        return const Left('خطا در گرفتن اطلاعات');
      }
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> submitVanInformation({
    required VanInformationInputDto dto,
  }) async {
    try {
      int? statusCode;
      final http.Response response = await http.post(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.driverSubmitVanInfo,
        body: dto.toJson(),
      );
      final Map<String, dynamic> jsonData = json.decode(response.body);
      print(jsonData);
      statusCode = response.statusCode;
      if (statusCode == 201) {
        return Right('اطلاعات با موفقیت ثبت شد');
      } else {
        return const Left('خطا');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
