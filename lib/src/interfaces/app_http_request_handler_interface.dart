import '../types/app_http_types.dart' show AppHttpResponse;

export '../types/app_http_types.dart' show AppHttpResponse;

abstract class AppHttpRequestHandlerInterface {
  Future<AppHttpResponse<T>> handleRequest<T>(
    Future<AppHttpResponse<T>> Function() request,
  );
}
