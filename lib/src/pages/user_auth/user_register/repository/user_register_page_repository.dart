import 'dart:convert';

import 'package:either_dart/either.dart';

import '../../../../infrastructures/commons/repository_urls.dart';
import 'package:http/http.dart' as http;

import '../models/user_register_dto.dart';
import '../models/user_register_view_model.dart';

class UserRegisterPageRepository {
  Future<Either<String, UserRegisterViewModel>> userRegister({
    required UserRegisterDto dto,
  }) async {
    try {
      int? statusCode;
      final http.Response response = await http.post(
        RepositoryUrls.userRegister,
        body: dto.toJson(),
      );
      final Map<String, dynamic> jsonData = json.decode(response.body);

      statusCode = response.statusCode;
      if (statusCode == 201) {
        final UserRegisterViewModel verifyViewModel =
            UserRegisterViewModel.fromJson(jsonData);
        return Right(verifyViewModel);
      } else {
        return const Left('حطا');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
