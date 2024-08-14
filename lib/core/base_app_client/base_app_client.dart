import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';



class BaseAppClient {
  String baseAppUrl;
 String apiKey;
  BaseAppClient(this.baseAppUrl,this.apiKey);

  Future<Dio> get _dio async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: baseAppUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: <String, dynamic>{
          "api": "1.0.0",
        },
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    )..interceptors.add(
      kReleaseMode
          ? LogInterceptor(
          request: false,
          requestBody: false,
          responseBody: false,
          responseHeader: false,
          requestHeader: false,
          error: false)
          : AwesomeDioInterceptor(
        // Optional, defaults to the 'log' function in the 'dart:developer' package.
        logger: debugPrint,
      ),
    );

    return dio;
  }



  /// GET Request
  Future<void> get(String path,
      {dynamic body,
        Map<String, dynamic>? queryParameters,
        required Function(dynamic, int? statusCode) onSuccess,
        required Function(String error, int? statusCode, {dynamic response})
        onFailure,
        Options? options,
        bool anonymous = false}) async {
    try {
      Dio dio = await _dio;
      Response<dynamic> response = await dio.get(path,
          queryParameters: queryParameters, options: options, data: body);
      final int? statusCode = response.statusCode;

      if (statusCode != null && (statusCode < 200 || statusCode >= 400)) {
        onFailure(response.statusMessage ?? "", statusCode,
            response: response.data);
      } else {
        onSuccess(response.data, statusCode);
      }
    } on DioError catch (e) {
      if (kDebugMode) print(e);
      if (e.response?.statusCode == 401 ||
          (e.error?.toString().contains("parse header value") ?? false)) {
      } else {
      }
    } on Exception catch (e) {
      onFailure(e.toString(), 500);
    }
  }

}
