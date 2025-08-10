import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../../infrastructures/commons/repository_urls.dart';

class SplashScreenPageRepository {
  Future<Either<String, bool>> checkConnection() async {
    int? statusCode;
    try {
      final http.Response resultOrException = await http.get(
        RepositoryUrls.checkConnection,
      );
      statusCode = resultOrException.statusCode;
      if (statusCode == 200) {
        return Right(true);
      }
      return Right(false);
    } on SocketException {
      return Left('اینترنت قطع است');
    }
  }
}
