import 'package:either_dart/either.dart';

import '../../../../infrastructures/commons/repository_url.dart';
import '../../../../infrastructures/utils/dio_handler.dart';
import '../model/log_in_dto.dart';

class LoginPageRepository {
  final DioHandler _dioHandler = DioHandler(isLoggedIn: false);

  Future<Either<String, dynamic>> logIn({required LogInDto dto}) async {
    final response = await _dioHandler.post(
      RepositoryUrls.logIn,
      data: dto.toJson(),
    );
    // TODO: Set log in method
    return Right(null);
    return response.fold(
      (left) => Left(response.left),
      (right) => Right(response.right),
    );
  }
}
