import 'dart:convert';

import 'app_http_logger.dart';
import 'interfaces/app_http_logger_handler_interface.dart';

final class DefaultAppHttpLoggerHandler
    implements AppHttpLoggerHandlerInterface {
  const DefaultAppHttpLoggerHandler(this._isDebugMode);

  final bool _isDebugMode;

  @override
  bool get isDebugMode => _isDebugMode;

  @override
  void logException(AppHttpException exception) {
    if (!isDebugMode) return;

    AppHttpLogger.log(
      '''
=====> [ START API ERROR ] +++++++++++++++++++++++++++++++++++++++++++++++++++++
Request URI: ${exception.requestOptions.uri}
Request Endpoint: ${exception.requestOptions.path}
Headers: ${exception.requestOptions.headers.toString()}
Query Params: ${exception.requestOptions.queryParameters.toString()}
Body: ${exception.requestOptions.data is Map ? jsonEncode(exception.requestOptions.data) : 'Not encodable body -> ${exception.requestOptions.data.runtimeType}'}

 ---

Status Code: ${exception.response?.statusCode ?? -1}
Message: ${exception.message ?? 'Empty Message'}
Exception Type: ${exception.type.name.toUpperCase()}
StackTrace: ${exception.stackTrace}
=====> [ END API ERROR ] -------------------------------------------------------''',
      color: AppHttpLogColors.brightRed,
    );
  }

  @override
  void logRequest(AppHttpRequest request) {
    if (!isDebugMode) return;

    AppHttpLogger.log(
      '''
=====> [ START API REQUEST ] +++++++++++++++++++++++++++++++++++++++++++++++++++
Method: ${request.method}
Path: ${request.path}
Base URL: ${request.baseUrl}
URI: ${request.uri}
Headers: ${request.headers.toString()}
Query Params: ${request.queryParameters.toString()}
Body: ${jsonEncode(request.data)}
=====> [ END API REQUEST ] -----------------------------------------------------''',
      color: AppHttpLogColors.brightYellow,
    );
  }

  @override
  void logResponse(AppHttpResponse response) {
    if (!isDebugMode) return;

    AppHttpLogger.log(
      '''
=====> [ START API RESPONSE ] ++++++++++++++++++++++++++++++++++++++++++++++++++
Status Code: ${response.statusCode}
Status Message: ${response.statusMessage}
Headers: ${response.headers.toString()}
Data: ${response.data}
=====> [ END API RESPONSE ] ----------------------------------------------------''',
      color: AppHttpLogColors.brightGreen,
    );
  }
}
