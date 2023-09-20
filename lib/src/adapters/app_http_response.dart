import 'package:dio/dio.dart';

import 'app_http_request.dart';

class AppHttpResponse<T> {
  final T? data;
  final AppHttpRequest request;
  final int? statusCode;
  final String? statusMessage;

  const AppHttpResponse({
    this.data,
    required this.request,
    this.statusCode,
    this.statusMessage,
  });

  factory AppHttpResponse.fromExternalResponse(Response<T> externalResponse) {
    return AppHttpResponse<T>(
      data: externalResponse.data,
      request: AppHttpRequest.fromExternalRequest(externalResponse.requestOptions),
      statusCode: externalResponse.statusCode,
      statusMessage: externalResponse.statusMessage,
    );
  }
}
