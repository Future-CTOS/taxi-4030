import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:logger/logger.dart';

import '../app_controller/app_controller.dart';

class DioHandler {
  // TODO: make this better for handle logs and try catches
  final Dio _dio;
  final Logger _logger = Logger();
  final String _baseUrl = AppController.instance.fullBaseUrl;

  DioHandler({
    final Map<String, dynamic>? headers,
    final bool isLoggedIn = true,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: AppController.instance.fullBaseUrl,
           headers: headers == null && isLoggedIn
               ? {'Authorization': 'Bearer ${AppController.instance.userToken}'}
               : headers,
           connectTimeout: const Duration(seconds: 10),
         ),
       );

  Future<Either<String, T>> post<T>(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    final path = '$_baseUrl$url';

    try {
      _logger.f(path);

      final response = await _dio.post<T>(
        path,
        queryParameters: queryParameters,
        data: data,
      );

      _logger.d(response.statusCode);

      _logger.i((response.data as Map<String, dynamic>)['data']);

      return Right((response.data as Map<String, dynamic>)['data'] as T);
    } catch (e) {
      _logger.e(e);

      return Left('$e');
    }
  }

  Future<Either<String, T>> get<T>(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    final path = '$_baseUrl$url';

    try {
      _logger.f(path);

      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        data: data,
      );

      _logger.d(response.statusCode);

      _logger.i((response.data as Map<String, dynamic>)['data']);

      return Right((response.data as Map<String, dynamic>)['data'] as T);
    } catch (e) {
      _logger.e(e);

      return Left('$e');
    }
  }

  Future<Either<String, T>> patch<T>(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    final path = '$_baseUrl$url';

    try {
      _logger.f(path);

      final response = await _dio.patch<T>(
        path,
        queryParameters: queryParameters,
        data: data,
      );

      _logger.d(response.statusCode);

      _logger.i((response.data as Map<String, dynamic>)['data']);

      return Right((response.data as Map<String, dynamic>)['data'] as T);
    } catch (e) {
      _logger.e(e);

      return Left('$e');
    }
  }

  Future<Either<String, T>> put<T>(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    final path = '$_baseUrl$url';

    try {
      _logger.f(path);

      final response = await _dio.put<T>(
        path,
        queryParameters: queryParameters,
        data: data,
      );

      _logger.d(response.statusCode);

      _logger.i((response.data as Map<String, dynamic>)['data']);

      return Right((response.data as Map<String, dynamic>)['data'] as T);
    } catch (e) {
      _logger.e(e);

      return Left('$e');
    }
  }

  Future<Either<String, T>> getChats<T>(final String url) async {
    final path = '$_baseUrl$url';

    try {
      _logger.f(path);

      final response = await _dio.get<T>(path);

      _logger.d(response.statusCode);

      _logger.i(response.data as T);

      return Right(response.data as T);
    } catch (e) {
      _logger.e(e);

      return Left('$e');
    }
  }

  Future<Either<String, T>> optionRequest<T>(final String url) async {
    final path = '$_baseUrl$url';

    try {
      _logger.f(path);

      final response = await _dio.request<T>(
        path,
        options: Options(method: 'OPTIONS'),
      );

      _logger.d(response.statusCode);

      _logger.i(response.data as T);

      return Right(response.data as T);
    } catch (e) {
      _logger.e(e);

      return Left('$e');
    }
  }
}
