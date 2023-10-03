import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'micro_app_http_interface.dart' show MicroAppHttpInterface;
import 'types/app_http_types.dart';
import 'utils/app_http_options.dart' show AppHttpOptions;
import 'utils/app_http_overrides.dart';
import 'utils/constants.dart';
import 'utils/interfaces/app_http_authorization_interface.dart';

export 'types/app_http_types.dart';
export 'utils/app_http_options.dart' show AppHttpOptions;

// TODO:
// 1 - Unit Tests
// 2 - Return with records
// 3 - Double certificate pinning

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
      return options.needsPinning
          ? AppHttpOverrides.generic()
          : AppHttpOverrides.pinned();
    });

    /// Implementation of Interceptor.
    _external?.interceptors.add(
      AppHttpInterceptor(
        onError: (exception, handler) async {
          options.customLoggerHandler?.logException(exception);
          handler.next(
            await options.customExceptionHandler.handleException(exception),
          );
        },
        onRequest: (request, handler) {
          options.customLoggerHandler?.logRequest(request);
          handler.next(request);
        },
        onResponse: (response, handler) {
          options.customLoggerHandler?.logResponse(response);
          handler.next(response);
        },
      ),
    );
  }

  final AppHttpOptions options;
  Dio? _external;

  Future<AppHttpException> onExceptionHandler(AppHttpException exception) {
    return options.customExceptionHandler.handleException(exception);
  }

  Future<AppHttpResponse<T>> onRequestHandler<T>(
    Future<AppHttpResponse<T>> Function() request,
  ) {
    return options.customRequestHandler.handleRequest(request);
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
