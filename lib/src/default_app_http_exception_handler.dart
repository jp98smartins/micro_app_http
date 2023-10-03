import 'types/app_http_types.dart' show AppHttpExceptionType;
import 'interfaces/app_http_exception_handler_interface.dart';

final class DefaultAppHttpExceptionHandler
    implements AppHttpExceptionHandlerInterface {
  const DefaultAppHttpExceptionHandler();

  @override
  Future<AppHttpException> handleException(AppHttpException exception) async {
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
    if ([
          AppHttpExceptionType.connectionError,
          AppHttpExceptionType.cancel,
        ].contains(exception.type) ||
        exception.response == null) {
      return exception.copyWith(message: 'No Connection Exception');
    }

    // Server Exceptions (500)
    final statusCode = (exception.response?.statusCode ?? -1);
    if (statusCode > 499 && statusCode < 600) {
      return exception.copyWith(message: 'Server Exception');
    }

    // Other Exceptions
    return exception;
  }
}
