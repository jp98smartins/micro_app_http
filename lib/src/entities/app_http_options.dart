import '../utils/constants.dart';
import 'app_http_exception_type_messages.dart';

class AppHttpOptions {
  final String baseUrl;

  final Duration connectionTimeout;

  final Duration delayBetweenRetries;

  final AppHttpExceptionTypeMessages? overrideExceptionMessages;

  final Duration receiveTimeout;

  final int retries;

  final Duration sendTimeout;

  const AppHttpOptions({
    this.baseUrl = '',
    this.connectionTimeout = Constants.connectionTimeout,
    this.delayBetweenRetries = Constants.delayBetweenRetries,
    this.overrideExceptionMessages,
    this.receiveTimeout = Constants.receiveTimeout,
    this.retries = Constants.retries,
    this.sendTimeout = Constants.sendTimeout,
  });
}
