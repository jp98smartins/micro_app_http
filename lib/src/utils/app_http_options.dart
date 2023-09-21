import '../entities/app_http_exception.dart';
import '../utils/constants.dart';
import 'enums/app_http_authorization_type.dart';

export 'enums/app_http_authorization_type.dart';

class AppHttpOptions {
  final AppHttpAuthorizationType authorizationType;

  final String baseUrl;

  final Duration connectionTimeout;

  final Duration delayBetweenRetries;

  final Duration receiveTimeout;

  final int retries;

  final Duration sendTimeout;

  final bool showLogs;

  final Future<AppHttpException> Function(AppHttpException exception)?
      handleException;

  const AppHttpOptions({
    this.authorizationType = AppHttpAuthorizationType.noAuth,
    this.baseUrl = '',
    this.connectionTimeout = Constants.connectionTimeout,
    this.delayBetweenRetries = Constants.delayBetweenRetries,
    this.handleException,
    this.receiveTimeout = Constants.receiveTimeout,
    this.retries = Constants.retries,
    this.sendTimeout = Constants.sendTimeout,
    this.showLogs = false,
  });
}
