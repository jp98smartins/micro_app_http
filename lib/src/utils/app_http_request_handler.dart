import 'package:micro_app_http/src/utils/constants.dart';

import '../types/app_http_types.dart';

abstract class RequestHandlerInterface {
  Future<AppHttpResponse<T>> customRequestHandler<T>(
    Future<AppHttpResponse<T>> Function() request,
  );
}

final class DefaultRequestHandler implements RequestHandlerInterface {
  const DefaultRequestHandler();

  @override
  Future<AppHttpResponse<T>> customRequestHandler<T>(
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
