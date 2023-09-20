import 'package:dio/dio.dart';

import 'app_http_request.dart';
import 'app_http_response.dart';

enum AppHttpExceptionType {
  /// Caused by an incorrect certificate.
  badCertificate('Bad Certificate'),

  /// The [AppHttpException] was caused by an incorrect status code.
  badResponse('Bad Response'),

  /// When the request is cancelled, it will throw a error with this type.
  canceled('Canceled'),

  /// Caused for example by a `xhr.onError` or SocketExceptions.
  connectionError('Connection Error'),

  /// Caused by a connection timeout.
  connectionTimeout('Connection Timeout'),

  /// It occurs when receiving timeout.
  receiveTimeout('Receive Timeout'),

  /// It occurs when url is sent timeout.
  sendTimeout('Send Timeout'),

  /// Default error type, Some other [Exception].
  unknown('Unknown');

  const AppHttpExceptionType(String formatedError);

  factory AppHttpExceptionType.fromExternalType(DioExceptionType type) {
    return switch (type) {
      DioExceptionType.connectionTimeout =>
        AppHttpExceptionType.connectionTimeout,
      DioExceptionType.sendTimeout => AppHttpExceptionType.sendTimeout,
      DioExceptionType.receiveTimeout => AppHttpExceptionType.receiveTimeout,
      DioExceptionType.badCertificate => AppHttpExceptionType.badCertificate,
      DioExceptionType.badResponse => AppHttpExceptionType.badResponse,
      DioExceptionType.cancel => AppHttpExceptionType.canceled,
      DioExceptionType.connectionError => AppHttpExceptionType.connectionError,
      DioExceptionType.unknown => AppHttpExceptionType.unknown,
    };
  }
}

class AppHttpException {
  final AppHttpRequest request;

  final AppHttpResponse? response;

  final AppHttpExceptionType exceptionType;

  final StackTrace stackTrace;

  final int? statusCode;

  final String message;

  AppHttpException({
    required this.request,
    this.response,
    required this.exceptionType,
    StackTrace? stackTrace,
    required this.statusCode,
    required this.message,
  }) : stackTrace = stackTrace ?? StackTrace.current;

  factory AppHttpException.fromExternalException(DioException exception) {
    final request = AppHttpRequest.fromExternalRequest(
      exception.requestOptions,
    );

    final response = exception.response != null
        ? AppHttpResponse.fromExternalResponse(
            exception.response!,
          )
        : null;

    final type = AppHttpExceptionType.fromExternalType(
      exception.type,
    );

    return AppHttpException(
      request: request,
      response: response,
      exceptionType: type,
      statusCode: response?.statusCode,
      message: response?.statusMessage ?? "AppHttpException => ${type.name}",
    );
  }

  AppHttpException overrideMessage(String overrideMessage) {
    return AppHttpException(
      request: request,
      response: response,
      exceptionType: exceptionType,
      statusCode: statusCode,
      message: overrideMessage,
    );
  }
}
