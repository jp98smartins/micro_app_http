import '../types/app_http_types.dart';
import '../utils/constants.dart';
import 'app_http_authorization.dart';
import 'app_http_request_handler.dart';

export 'enums/app_http_authorization_type.dart';

class AppHttpOptions {
  final AppHttpAuthorizationInterface authorization;

  final String baseUrl;

  final Duration connectionTimeout;

  final RequestHandlerInterface customRequestHandler;

  final Duration delayBetweenRetries;

  final bool needPinning;

  final Duration receiveTimeout;

  final int retries;

  final Duration sendTimeout;

  final bool showLogs;

  final Future<AppHttpException> Function(AppHttpException exception)?
      handleException;

  const AppHttpOptions({
    this.authorization = const NoAuthAppHttpAuthorization(),
    this.baseUrl = '',
    this.connectionTimeout = Constants.connectionTimeout,
    this.customRequestHandler = const DefaultRequestHandler(),
    this.delayBetweenRetries = Constants.delayBetweenRetries,
    this.needPinning = false,
    this.handleException,
    this.receiveTimeout = Constants.receiveTimeout,
    this.retries = Constants.retries,
    this.sendTimeout = Constants.sendTimeout,
    this.showLogs = false,
  });
}
