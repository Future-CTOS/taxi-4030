import 'dart:convert';

import 'package:either_dart/either.dart';
import '../../../../infrastructures/commons/repository_urls.dart';
import 'package:http/http.dart' as http;

import '../../../../infrastructures/commons/token_info.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../models/dtos/car_information_input_dto.dart';
import '../models/view_models/car_information_input_view_model.dart';

class CarInformationInputRepository {
  Future<Either<String, CarInformationInputViewModel>> fetchCarOptions() async {
    try {
      int? statusCode;
      final http.Response response = await http.get(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.driverGetCarInfo,
      );
      final Map<String, dynamic> jsonData = json.decode(response.body);
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final CarInformationInputViewModel viewModel =
            CarInformationInputViewModel.fromJson(jsonData);
        return Right(viewModel);
      } else {
        return const Left('خطا در گرفتن اطلاعات');
      }
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> submitCarInformation({
    required CarInformationInputDto dto,
  }) async {
    try {
      int? statusCode;

      final http.Response response = await http.post(
        headers: TokenInfo.authHeader(),
        RepositoryUrls.driverSubmitCarInfo,
        body: dto.toJson(),
      );

      final Map<String, dynamic> jsonData = json.decode(response.body);
      print('json Data = $jsonData');
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
