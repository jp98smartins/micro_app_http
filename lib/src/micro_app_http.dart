import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'micro_app_http_interface.dart';
import 'utils/app_http_logger.dart';
import 'utils/app_http_options.dart';
import 'utils/app_http_overrides.dart';
import 'utils/constants.dart';

/// TODO:
/// 1. Authentication options

AppHttpException defaultExceptionHandler(AppHttpException exception) {
  // Certificate Exceptions
  if (exception.type == AppHttpExceptionType.badCertificate) {
    return exception.copyWith(message: 'Certificate Exception');
  }

  // Timeout Exceptions
  if ([
    AppHttpExceptionType.connectionTimeout,
    AppHttpExceptionType.receiveTimeout,
    AppHttpExceptionType.sendTimeout
  ].contains(exception.type)) {
    return exception.copyWith(message: 'Timeout Exception');
  }

  // No Connection Exceptions
  if (exception.type == AppHttpExceptionType.connectionError ||
      exception.response == null) {
    return exception.copyWith(message: 'No connection Exception');
  }

  // Server Exceptions (500)
  if (exception.response?.statusCode == 500) {
    return exception.copyWith(message: 'Server Exception');
  }

  // Other Exceptions
  return exception;
}

final class MicroAppHttp implements MicroAppHttpInterface {
  MicroAppHttp(this.options) {
    final sourceOptions = BaseOptions(
      baseUrl: options.baseUrl,
      connectTimeout: options.connectionTimeout,
      receiveTimeout: options.receiveTimeout,
      sendTimeout: options.sendTimeout,
    );

    _external = Dio(sourceOptions);

    /// Implementation of BadCertificateCallback/Pinning.
    ///
    /// Take a look at the [AppHttpOverrides.loadCertificate] method to understand
    /// how to pin the app.
    _external!.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
      return options.needPinning
          ? AppHttpOverrides.generic()
          : AppHttpOverrides.pinned();
    });

    /// Implementation of Interceptor.
    _external?.interceptors.add(
      AppHttpInterceptor(
        onError: (exception, handler) async {
          if (options.showLogs) {
            AppHttpLogger.log(
              '''
=====> [ START API ERROR ] +++++++++++++++++++++++++++++++++++++++++++++++++++++
Request URI: ${exception.requestOptions.uri}
Request Endpoint: ${exception.requestOptions.path}
Headers: ${exception.requestOptions.headers.toString()}
Query Params: ${exception.requestOptions.queryParameters.toString()}
Body: ${jsonEncode(exception.requestOptions.data)}

 ---

Status Code: ${exception.response?.statusCode ?? -1}
Message: ${exception.message ?? 'Empty Message'}
Exception Type: ${exception.type.name.toUpperCase()}
StackTrace: ${exception.stackTrace}
=====> [ END API ERROR ] -------------------------------------------------------''',
              color: AppHttpLogColors.brightRed,
            );
          }

          handler.next(
            await options.handleException?.call(exception) ??
                defaultExceptionHandler(exception),
          );
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

  Future<AppHttpResponse<T>> onRequestHandler<T>(
    Future<AppHttpResponse<T>> Function() request,
  ) {
    return options.customRequestHandler.customRequestHandler(request);
  }

  Future<Map<String, dynamic>> headers() async {
    const headers = Constants.basicHeaders;

    if (options.authorization.authorizationType ==
        AppHttpAuthorizationType.headers) {
      headers.addAll(await options.authorization.getAuthorization());
    }

    return headers;
  }

  // Implementation of HTTP Methods.

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

      return onRequestHandler(
        () => _external!.delete<T>(
          endpoint,
          data: body,
          queryParameters: queryParams,
          options: Options(headers: headers),
        ),
      );
    }

    throw AppHttpException(
      type: AppHttpExceptionType.unknown,
      requestOptions: AppHttpRequest(
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

      return onRequestHandler(
        () => _external!.get<T>(
          endpoint,
          queryParameters: queryParams,
          options: Options(headers: headers),
        ),
      );
    }

    throw AppHttpException(
      type: AppHttpExceptionType.unknown,
      requestOptions: AppHttpRequest(
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

      return onRequestHandler(
        () => _external!.patch<T>(
          endpoint,
          data: body,
          queryParameters: queryParams,
          options: Options(headers: headers),
        ),
      );
    }

    throw AppHttpException(
      type: AppHttpExceptionType.unknown,
      requestOptions: AppHttpRequest(
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

      return onRequestHandler(
        () => _external!.post<T>(
          endpoint,
          data: body,
          queryParameters: queryParams,
          options: Options(headers: headers),
        ),
      );
    }

    throw AppHttpException(
      type: AppHttpExceptionType.unknown,
      requestOptions: AppHttpRequest(
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

      return onRequestHandler(
        () => _external!.put<T>(
          endpoint,
          data: body,
          queryParameters: queryParams,
          options: Options(headers: headers),
        ),
      );
    }

    throw AppHttpException(
      type: AppHttpExceptionType.unknown,
      requestOptions: AppHttpRequest(
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
      message: "There's no instance of MicroAppHttp | -1",
    );
  }
}
