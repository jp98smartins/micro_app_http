import '../types/app_http_types.dart'
    show AppHttpException, AppHttpRequest, AppHttpResponse;

export '../types/app_http_types.dart'
    show AppHttpException, AppHttpRequest, AppHttpResponse;

abstract class AppHttpLoggerHandlerInterface {
  bool get isDebugMode;

  void logException(AppHttpException exception);

  void logRequest(AppHttpRequest request);

  void logResponse(AppHttpResponse response);
}
