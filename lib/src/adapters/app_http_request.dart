import 'package:dio/dio.dart';

import 'app_http_headers.dart';
import 'app_http_query_params.dart';

class AppHttpRequest {
  final String baseUrl;
  final dynamic body;
  final String endpoint;
  final AppHttpHeaders headers;
  final AppHttpQueryParams? queryParams;
  final String url;

  const AppHttpRequest({
    required this.baseUrl,
    required this.body,
    required this.endpoint,
    this.headers = const AppHttpHeaders.basicJson(),
    this.queryParams,
    required this.url,
  });

  factory AppHttpRequest.fromExternalRequest(RequestOptions request) {
    return AppHttpRequest(
      baseUrl: request.baseUrl,
      body: request.data,
      endpoint: request.path.replaceAll(request.baseUrl, ''),
      headers: AppHttpHeaders.custom(request.headers),
      queryParams: AppHttpQueryParams.custom(request.queryParameters),
      url: request.path,
    );
  }
}
