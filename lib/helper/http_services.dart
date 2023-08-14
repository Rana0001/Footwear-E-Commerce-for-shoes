import 'package:dio/dio.dart';
import 'package:footwear/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpServices {
  static final HttpServices _instance = HttpServices._internal();
  factory HttpServices() => _instance;
  HttpServices._internal();

  Dio? _dio;

  final int _timeout = 6000;

  final Map<String, dynamic> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': Constant.token,
    'language': 'en'
  };

  Dio getDioInstance() {
    _dio ??= Dio(
      BaseOptions(
        baseUrl: Constant.baseURL,
        connectTimeout: _timeout,
        receiveTimeout: _timeout,
        headers: _headers,
      ),
    );
    _dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      // responseHeader: true,
    ));
    return _dio!;
  }
}
