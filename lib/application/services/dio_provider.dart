import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  final String _baseUrl = 'https://api.escuelajs.co/api/v1';

  /// [dio] is a [Dio] instance.
  @lazySingleton
  Dio dio() {
    final dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (!options.path.contains('http')) {
            options.path = _baseUrl + options.path;
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          return handler.next(error);
        },
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger());
    }
    return dio;
  }
}
