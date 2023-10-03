import '../types/app_http_types.dart' show AppHttpException;
import 'constants.dart';
import 'interfaces/app_http_request_handler_interface.dart';

final class DefaultAppHttpRequestHandler
    implements AppHttpRequestHandlerInterface {
  const DefaultAppHttpRequestHandler();

  @override
  Future<AppHttpResponse<T>> handleRequest<T>(
    Future<AppHttpResponse<T>> Function() request, {
    Duration delayBetweenRetries = Constants.delayBetweenRetries,
    int retries = Constants.retries,
  }) async {
    try {
      return request();
    } on AppHttpException catch (exception) {
      if (exception.response == null) {
        await Future.delayed(Constants.delayBetweenRetries);
        for (int i = 0; i < retries; i++) {
          try {
            return request();
          } on AppHttpException catch (_) {
            if (i == retries - 1) rethrow;
          }
        }
      }

      rethrow;
    }
  }
}
