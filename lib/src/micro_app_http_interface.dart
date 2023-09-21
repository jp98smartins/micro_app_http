import 'types/app_http_types.dart';

export 'types/app_http_types.dart';

abstract class MicroAppHttpInterface {
  Future<AppHttpResponse<T>?> delete<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? key,
    String? microapp,
    bool needAuthorization = false,
    String? overrideBaseUrl,
    Map<String, dynamic>? queryParams,
  });

  Future<AppHttpResponse<T>?> get<T>(
    String endpoint, {
    Map<String, dynamic>? headers,
    String? key,
    String? microapp,
    bool needAuthorization = false,
    String? overrideBaseUrl,
    Map<String, dynamic>? queryParams,
  });

  Future<AppHttpResponse<T>?> patch<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? key,
    String? microapp,
    bool needAuthorization = false,
    String? overrideBaseUrl,
    Map<String, dynamic>? queryParams,
  });

  Future<AppHttpResponse<T>?> post<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? key,
    String? microapp,
    bool needAuthorization = false,
    String? overrideBaseUrl,
    Map<String, dynamic>? queryParams,
  });

  Future<AppHttpResponse<T>?> put<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? key,
    String? microapp,
    bool needAuthorization = false,
    String? overrideBaseUrl,
    Map<String, dynamic>? queryParams,
  });
}
