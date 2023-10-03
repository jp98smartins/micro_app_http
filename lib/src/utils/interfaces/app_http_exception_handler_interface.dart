import '../../types/app_http_types.dart' show AppHttpException;

export '../../types/app_http_types.dart' show AppHttpException;

abstract class AppHttpExceptionHandlerInterface {
  Future<AppHttpException> handleException(AppHttpException exception);
}
