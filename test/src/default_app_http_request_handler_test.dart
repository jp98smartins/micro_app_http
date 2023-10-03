import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:micro_app_http/src/default_app_http_request_handler.dart';
import 'package:micro_app_http/src/types/app_http_types.dart';

Future<AppHttpResponse<T>> returnExceptionWithResponse<T>() async {
  throw AppHttpException(
    type: AppHttpExceptionType.badResponse,
    requestOptions: AppHttpRequest(),
    response: AppHttpResponse(
      requestOptions: AppHttpRequest(),
      statusCode: 404,
      statusMessage: 'Route Not Found',
      data: {'statusCode': 404, 'message': 'Object was not found!'},
    ),
    message: 'Route Not Found',
  );
}

Future<AppHttpResponse<T>> returnExceptionWithoutResponse<T>() async {
  throw AppHttpException(
    type: AppHttpExceptionType.receiveTimeout,
    requestOptions: AppHttpRequest(),
  );
}

Future<AppHttpResponse<Map<String, dynamic>>> returnResponse() async {
  return AppHttpResponse<Map<String, dynamic>>(
    requestOptions: AppHttpRequest(),
    statusCode: 200,
    statusMessage: 'Object created with success!',
    data: {'statusCode': 200, 'message': 'Object created with success!'},
  );
}

void main() {
  group(
    'DefaultAppHttpRequestHandler handleRequest',
    () {
      const defaultRequestHandler = DefaultAppHttpRequestHandler();

      test('| Should return a AppHttpResponse<Map<String, dynamic>>', () async {
        // Arrange
        const statusCode = 200;
        const statusMessage = 'Object created with success!';
        const request = returnResponse;

        // Act
        var result = await defaultRequestHandler
            .handleRequest<Map<String, dynamic>>(request);

        // Assert
        expect(result, isA<AppHttpResponse<Map<String, dynamic>>>());
        expect(result.statusCode, statusCode);
        expect(result.statusMessage, statusMessage);
        expect(result.data, isA<Map<String, dynamic>>());
        // verify(request).called(1);
      });
    },
  );
}
