import '../utils/constants.dart';
import 'default_app_http_authorization.dart' show DefaultAppHttpAuthorization;
import 'default_app_http_exception_handler.dart'
    show DefaultAppHttpExceptionHandler;
import 'default_app_http_logger_handler.dart' show DefaultAppHttpLoggerHandler;
import 'default_app_http_request_handler.dart'
    show DefaultAppHttpRequestHandler;
import 'interfaces/app_http_authorization_interface.dart'
    show AppHttpAuthorizationInterface;
import 'interfaces/app_http_exception_handler_interface.dart'
    show AppHttpExceptionHandlerInterface;
import 'interfaces/app_http_logger_handler_interface.dart'
    show AppHttpLoggerHandlerInterface;
import 'interfaces/app_http_request_handler_interface.dart'
    show AppHttpRequestHandlerInterface;

export 'interfaces/app_http_authorization_interface.dart'
    show AppHttpAuthorizationInterface;
export 'interfaces/app_http_exception_handler_interface.dart'
    show AppHttpExceptionHandlerInterface;
export 'interfaces/app_http_logger_handler_interface.dart'
    show AppHttpLoggerHandlerInterface;
export 'interfaces/app_http_request_handler_interface.dart'
    show AppHttpRequestHandlerInterface;

class AppHttpOptions {
  final AppHttpAuthorizationInterface authorization;

  final String baseUrl;

  final Duration connectionTimeout;

  final AppHttpExceptionHandlerInterface customExceptionHandler;

  final AppHttpLoggerHandlerInterface? customLoggerHandler;

  final AppHttpRequestHandlerInterface customRequestHandler;

  final Duration delayBetweenRetries;

  final bool isDebugMode;

  final bool needsPinning;

  final Duration receiveTimeout;

  final int retries;

  final Duration sendTimeout;

  AppHttpOptions({
    this.authorization = const DefaultAppHttpAuthorization(),
    required this.baseUrl,
    this.connectionTimeout = Constants.connectionTimeout,
    this.customExceptionHandler = const DefaultAppHttpExceptionHandler(),
    this.customRequestHandler = const DefaultAppHttpRequestHandler(),
    this.delayBetweenRetries = Constants.delayBetweenRetries,
    this.isDebugMode = false,
    this.needsPinning = false,
    this.receiveTimeout = Constants.receiveTimeout,
    this.retries = Constants.retries,
    this.sendTimeout = Constants.sendTimeout,
  }) : customLoggerHandler = DefaultAppHttpLoggerHandler(isDebugMode);
}
