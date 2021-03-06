import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient {
  final String apiBaseUrl;

  DioClient({@required this.apiBaseUrl});

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      headers: {'accept':'*/*'},
      baseUrl: apiBaseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    dio.interceptors.addAll(<Interceptor>[_loggingInterceptor()]);

    return dio;
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      debugPrint("Request: ${options.uri} -- headers --${options.headers.toString()} -- payload -- ${options.data}");

      return options;
      //return dio.reject("Request: ${options.uri} -- headers -- ${options.headers.toString()} -- payload -- ${options.data}");

      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (Response response) {
      // Do something with response data
      if (response.statusCode == 200) {
        debugPrint("Response: ${response.request.uri} -- headers -- ${response.headers.toString()} -- payload --${jsonEncode(response.data)}");
      } else {
        debugPrint("Dio Response Status and Payload: ${response.statusCode} -- payload -- ${response.data}");
      }
      return response; // continue
    }, onError: (DioError e) {
      // Do something with response error
      debugPrint("Dio Response Error --> $e -- payload -- ${e.response.data}");
      return e; //continue
    });
  }
}