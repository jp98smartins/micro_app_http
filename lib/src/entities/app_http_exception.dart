import 'package:dio/dio.dart';

import '../types/app_http_types.dart';
import '../utils/enums/app_http_exception_type.dart';

export '../types/app_http_types.dart';

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
    final type = AppHttpExceptionType.fromExternalType(exception.type);
    return AppHttpException(
      request: exception.requestOptions,
      response: exception.response,
      exceptionType: type,
      statusCode: exception.response?.statusCode,
      message: exception.response?.statusMessage ??
          "AppHttpException => ${type.formatedError}",
    );
  }
}
