import 'package:dio/dio.dart';

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

  final String formatedError;

  const AppHttpExceptionType(this.formatedError);

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
