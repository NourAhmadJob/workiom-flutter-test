import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../api/api_config.dart';
import '../utils/secure_storage.dart';

class DioHelper {
  static late Dio _dio;
  static String? _token;

  static Future<void> init() async {
    _dio = Dio();
    if (await SecureStorage.getAccessToken() != 'null') {
      _token = await SecureStorage.getAccessToken();
    }
    _initApiClient();
  }

  static bool isLogin() {
    return _token != null ? true : false;
  }

  static void _initApiClient() {
    if (_token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $_token';
    }
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Content-Type'] = 'application/json';

    _dio.options.baseUrl = ApiConfig.domain;
    _dio.options.responseType = ResponseType.json;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    _dio.options.validateStatus = (status) => status != null && status < 500;

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
    HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }

  static Future<void> setToken(String token) async {
    _token = token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    print('Access token set');
  }

  Dio get dio => _dio;
}
