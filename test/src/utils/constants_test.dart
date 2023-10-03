import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_http/src/utils/constants.dart';

void main() {
  group(
    'Constants Values',
    () {
      test('| Connection Timeout should be: 11 seconds', () {
        // Arrange
        const seconds = 11;

        // Act
        var connectionTimeout = Constants.connectionTimeout;

        // Assert
        expect(connectionTimeout, isA<Duration>());
        expect(connectionTimeout.inSeconds, seconds);
      });

      test('| Delay Between Retries should be: 3 seconds', () {
        // Arrange
        const seconds = 3;

        // Act
        var delayBetweenRetries = Constants.delayBetweenRetries;

        // Assert
        expect(delayBetweenRetries, isA<Duration>());
        expect(delayBetweenRetries.inSeconds, seconds);
      });

      test('| Receive Timeout should be: 11 seconds', () {
        // Arrange
        const seconds = 11;

        // Act
        var receiveTimeout = Constants.receiveTimeout;

        // Assert
        expect(receiveTimeout, isA<Duration>());
        expect(receiveTimeout.inSeconds, seconds);
      });

      test('| Retries should be: 1', () {
        // Arrange
        const amount = 1;

        // Act
        var retries = Constants.retries;

        // Assert
        expect(retries, isA<int>());
        expect(retries, amount);
      });

      test('| Send Timeout should be: 11 seconds', () {
        // Arrange
        const seconds = 11;

        // Act
        var sendTimeout = Constants.sendTimeout;

        // Assert
        expect(sendTimeout, isA<Duration>());
        expect(sendTimeout.inSeconds, seconds);
      });

      test('| Basic Headers should have [accept] and [content-type] keys', () {
        // Arrange
        const acceptKey = 'accept';
        const contentTypeKey = 'content-type';

        // Act
        var basicHeaders = Constants.basicHeaders;

        // Assert
        expect(basicHeaders, isA<Map<String, String>>());
        expect(basicHeaders.containsKey(acceptKey), true);
        expect(basicHeaders.containsKey(contentTypeKey), true);
      });

      test('| Basic Headers Accept should be "*/*"', () {
        // Arrange
        const acceptKey = 'accept';
        const defaulValue = '*/*';

        // Act
        var basicHeaders = Constants.basicHeaders;

        // Assert
        expect(basicHeaders, isA<Map<String, String>>());
        expect(basicHeaders[acceptKey], defaulValue);
      });

      test('| Basic Headers Content-Type should be "application/json"', () {
        // Arrange
        const acceptKey = 'content-type';
        const defaulValue = 'application/json';

        // Act
        var basicHeaders = Constants.basicHeaders;

        // Assert
        expect(basicHeaders, isA<Map<String, String>>());
        expect(basicHeaders[acceptKey], defaulValue);
      });
    },
  );
}
