import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_http/src/types/app_http_types.dart';
import 'package:micro_app_http/src/utils/default_app_http_exception_handler.dart';

void main() {
  group(
    'DefaultExceptionHandler Exceptions',
    () {
      const defaultExceptionHandler = DefaultAppHttpExceptionHandler();

      test(
          '| AppHttpExceptionType.badCertificate should return "Certificate Exception" message',
          () async {
        // Arrange
        const statusCode = 500;
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.badCertificate;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          response: AppHttpResponse(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'badCertificate');
        expect(result.message, 'Certificate Exception');
      });

      test(
          '| AppHttpExceptionType.connectionTimeout should return "Timeout Exception" message',
          () async {
        // Arrange
        const statusCode = 500;
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.connectionTimeout;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          response: AppHttpResponse(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'connectionTimeout');
        expect(result.message, 'Timeout Exception');
      });

      test(
          '| AppHttpExceptionType.receiveTimeout should return "Timeout Exception" message',
          () async {
        // Arrange
        const statusCode = 500;
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.receiveTimeout;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          response: AppHttpResponse(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'receiveTimeout');
        expect(result.message, 'Timeout Exception');
      });

      test(
          '| AppHttpExceptionType.sendTimeout should return "Timeout Exception" message',
          () async {
        // Arrange
        const statusCode = 500;
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.sendTimeout;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          response: AppHttpResponse(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'sendTimeout');
        expect(result.message, 'Timeout Exception');
      });

      test(
          '| AppHttpExceptionType.connectionError should return "No connection Exception" message',
          () async {
        // Arrange
        const statusCode = 500;
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.connectionError;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          response: AppHttpResponse(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'connectionError');
        expect(result.message, 'No Connection Exception');
      });

      test(
          '| AppHttpExceptionType.cancel should return "No connection Exception" message',
          () async {
        // Arrange
        const statusCode = 500;
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.cancel;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          response: AppHttpResponse(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'cancel');
        expect(result.message, 'No Connection Exception');
      });

      test(
          '| AppHttpExceptionType.unknown and Response is [null] should return "No connection Exception" message',
          () async {
        // Arrange
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.unknown;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'unknown');
        expect(result.message, 'No Connection Exception');
      });

      test(
          '| AppHttpExceptionType.badResponse and Response is [null] should return "No connection Exception" message',
          () async {
        // Arrange
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.badResponse;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'badResponse');
        expect(result.message, 'No Connection Exception');
      });

      test(
          '| AppHttpExceptionType.unknown and Status Code is 5XX should return "Server Exception" message (500)',
          () async {
        // Arrange
        const statusCode = 500;
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.unknown;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          response: AppHttpResponse(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'unknown');
        expect(result.message, 'Server Exception');
      });

      test(
          '| AppHttpExceptionType.unknown and Status Code is 5XX should return "Server Exception" message (599)',
          () async {
        // Arrange
        const statusCode = 599;
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.unknown;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          response: AppHttpResponse(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'unknown');
        expect(result.message, 'Server Exception');
      });
      test(
          '| AppHttpExceptionType.badResponse and Status Code is 5XX should return "Server Exception" message (500)',
          () async {
        // Arrange
        const statusCode = 500;
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.badResponse;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          response: AppHttpResponse(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'badResponse');
        expect(result.message, 'Server Exception');
      });

      test(
          '| AppHttpExceptionType.badResponse and Status Code is 5XX should return "Server Exception" message (599)',
          () async {
        // Arrange
        const statusCode = 599;
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.badResponse;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          response: AppHttpResponse(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'badResponse');
        expect(result.message, 'Server Exception');
      });

      test(
          '| AppHttpExceptionType.unknown and Status Code is not 5XX should return its message',
          () async {
        // Arrange
        const statusCode = 404;
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.unknown;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          response: AppHttpResponse(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'unknown');
        expect(result.message, 'Route Not Found!');
      });

      test(
          '| AppHttpExceptionType.badResponse and Status Code is not 5XX should return its message',
          () async {
        // Arrange
        const statusCode = 404;
        const errorMessage = 'Route Not Found!';
        const exceptionType = AppHttpExceptionType.badResponse;
        final requestOptions = AppHttpRequest();
        final exception = AppHttpException(
          message: errorMessage,
          requestOptions: requestOptions,
          response: AppHttpResponse(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
          type: exceptionType,
        );

        // Act
        var result = await defaultExceptionHandler.handleException(exception);

        // Assert
        expect(result, isA<AppHttpException>());
        expect(result.type, isA<AppHttpExceptionType>());
        expect(result.type.name, 'badResponse');
        expect(result.message, 'Route Not Found!');
      });
    },
  );
}
