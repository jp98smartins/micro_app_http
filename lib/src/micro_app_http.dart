import 'dart:convert';

import 'package:dio/dio.dart';

import 'entities/app_http_exception.dart';
import 'micro_app_http_interface.dart';
import 'utils/app_http_logger.dart';
import 'utils/app_http_options.dart';
import 'utils/enums/app_http_exception_type.dart';

final class MicroAppHttp implements MicroAppHttpInterface {
  MicroAppHttp(this.options) {
    final sourceOptions = BaseOptions(
      baseUrl: options.baseUrl,
      connectTimeout: options.connectionTimeout,
      receiveTimeout: options.receiveTimeout,
      sendTimeout: options.sendTimeout,
    );

    _external = Dio(sourceOptions);

    // Implementation of Interceptor.
    _external?.interceptors.add(
      AppHttpInterceptor(
        onError: (error, handler) async {
          if (options.showLogs) {
            final exception = AppHttpException.fromExternalException(error);
            AppHttpLogger.log(
              '''
=====> [ START API ERROR ] +++++++++++++++++++++++++++++++++++++++++++++++++++++
Request URI: ${exception.request.uri}
Request Endpoint: ${exception.request.path}
Headers: ${exception.request.headers.toString()}
Query Params: ${exception.request.queryParameters.toString()}
Body: ${jsonEncode(exception.request.data)}

 ---

Status Code: ${exception.statusCode}
Message: ${exception.message}
Exception Type: ${exception.exceptionType.formatedError}
StackTrace: ${exception.stackTrace}
=====> [ END API ERROR ] -------------------------------------------------------''',
              color: AppHttpLogColors.brightRed,
            );
          }

          handler.next(await options.handleException?.call(exception));
        },
        onRequest: (request, handler) {
          if (options.showLogs) {
            AppHttpLogger.log(
              '''
=====> [ START API REQUEST ] +++++++++++++++++++++++++++++++++++++++++++++++++++
Method: ${request.method}
Path: ${request.path}
Base URL: ${request.baseUrl}
URI: ${request.uri}
Headers: ${request.headers.toString()}
Query Params: ${request.queryParameters.toString()}
Body: ${jsonEncode(request.data)}
=====> [ END API REQUEST ] -----------------------------------------------------''',
              color: AppHttpLogColors.brightBlue,
            );
          }

          handler.next(request);
        },
        onResponse: (response, handler) {
          if (options.showLogs) {
            AppHttpLogger.log(
              '''
=====> [ START API RESPONSE ] ++++++++++++++++++++++++++++++++++++++++++++++++++
Status Code: ${response.statusCode}
Status Message: ${response.statusMessage}
Headers: ${response.headers.toString()}
Data: ${response.data}
=====> [ END API RESPONSE ] ----------------------------------------------------''',
              color: AppHttpLogColors.brightBlue,
            );
          }

          handler.next(response);
        },
      ),
    );
  }

  final AppHttpOptions options;
  Dio? _external;

  // Implementation of methods.

  @override
  Future<AppHttpResponse<T>> delete<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? key,
    String? microapp,
    bool needAuthorization = false,
    String? overrideBaseUrl,
    Map<String, dynamic>? queryParams,
  }) async {
    if (_external != null) {
      _external!.options.baseUrl = overrideBaseUrl ?? options.baseUrl;

      return _external!.delete<T>(
        endpoint,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
    }

    throw AppHttpException(
      exceptionType: AppHttpExceptionType.unknown,
      request: AppHttpRequest(
        baseUrl: options.baseUrl,
        connectTimeout: options.connectionTimeout,
        data: body,
        headers: headers,
        method: 'DELETE',
        path: endpoint,
        queryParameters: queryParams,
        receiveTimeout: options.receiveTimeout,
        sendTimeout: options.sendTimeout,
      ),
      response: null,
      statusCode: -1,
      message: "There's no instance of MicroAppHttp | -1",
    );
  }

  @override
  Future<AppHttpResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? headers,
    String? key,
    String? microapp,
    bool needAuthorization = false,
    String? overrideBaseUrl,
    Map<String, dynamic>? queryParams,
  }) {
    if (_external != null) {
      _external!.options.baseUrl = overrideBaseUrl ?? options.baseUrl;

      return _external!.get<T>(
        endpoint,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
    }

    throw AppHttpException(
      exceptionType: AppHttpExceptionType.unknown,
      request: AppHttpRequest(
        baseUrl: options.baseUrl,
        connectTimeout: options.connectionTimeout,
        headers: headers,
        method: 'GET',
        path: endpoint,
        queryParameters: queryParams,
        receiveTimeout: options.receiveTimeout,
        sendTimeout: options.sendTimeout,
      ),
      response: null,
      statusCode: -1,
      message: "There's no instance of MicroAppHttp | -1",
    );
  }

  @override
  Future<AppHttpResponse<T>> patch<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? key,
    String? microapp,
    bool needAuthorization = false,
    String? overrideBaseUrl,
    Map<String, dynamic>? queryParams,
  }) {
    if (_external != null) {
      _external!.options.baseUrl = overrideBaseUrl ?? options.baseUrl;

      return _external!.patch<T>(
        endpoint,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
    }

    throw AppHttpException(
      exceptionType: AppHttpExceptionType.unknown,
      request: AppHttpRequest(
        baseUrl: options.baseUrl,
        connectTimeout: options.connectionTimeout,
        data: body,
        headers: headers,
        method: 'PATCH',
        path: endpoint,
        queryParameters: queryParams,
        receiveTimeout: options.receiveTimeout,
        sendTimeout: options.sendTimeout,
      ),
      response: null,
      statusCode: -1,
      message: "There's no instance of MicroAppHttp | -1",
    );
  }

  @override
  Future<AppHttpResponse<T>> post<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? key,
    String? microapp,
    bool needAuthorization = false,
    String? overrideBaseUrl,
    Map<String, dynamic>? queryParams,
  }) {
    if (_external != null) {
      _external!.options.baseUrl = overrideBaseUrl ?? options.baseUrl;

      return _external!.post<T>(
        endpoint,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
    }

    throw AppHttpException(
      exceptionType: AppHttpExceptionType.unknown,
      request: AppHttpRequest(
        baseUrl: options.baseUrl,
        connectTimeout: options.connectionTimeout,
        data: body,
        headers: headers,
        method: 'POST',
        path: endpoint,
        queryParameters: queryParams,
        receiveTimeout: options.receiveTimeout,
        sendTimeout: options.sendTimeout,
      ),
      response: null,
      statusCode: -1,
      message: "There's no instance of MicroAppHttp | -1",
    );
  }

  @override
  Future<AppHttpResponse<T>> put<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? key,
    String? microapp,
    bool needAuthorization = false,
    String? overrideBaseUrl,
    Map<String, dynamic>? queryParams,
  }) {
    if (_external != null) {
      _external!.options.baseUrl = overrideBaseUrl ?? options.baseUrl;

      return _external!.put<T>(
        endpoint,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
    }

    throw AppHttpException(
      exceptionType: AppHttpExceptionType.unknown,
      request: AppHttpRequest(
        baseUrl: options.baseUrl,
        connectTimeout: options.connectionTimeout,
        data: body,
        headers: headers,
        method: 'PUT',
        path: endpoint,
        queryParameters: queryParams,
        receiveTimeout: options.receiveTimeout,
        sendTimeout: options.sendTimeout,
      ),
      response: null,
      statusCode: -1,
      message: "There's no instance of MicroAppHttp | -1",
    );
  }
}
