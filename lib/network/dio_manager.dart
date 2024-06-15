import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';

class DioManager {
  static final DioManager _instance = DioManager._internal();
  factory DioManager() => _instance;

  DioManager._internal();

  Dio _dio = Dio();

  init() {
    // _dio ??= Dio(baseOptions);
    _dio.interceptors.add(
      AwesomeDioInterceptor()
    );
  }

  Dio get dio => _dio;

}