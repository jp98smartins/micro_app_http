import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_http/src/default_app_http_authorization.dart';
import 'package:micro_app_http/src/utils/enums/app_http_authorization_type.dart';

void main() {
  group(
    'DefaultAppHttpAuthorization Authorization',
    () {
      const defaultExceptionHandler = DefaultAppHttpAuthorization();

      test(
          '| authorizationType should return [AppHttpAuthorizationType.noAuthorization]',
          () async {
        // Arrange
        const authorizationName = 'noAuthorization';

        // Act
        var authorization = defaultExceptionHandler.authorizationType;

        // Assert
        expect(authorization, isA<AppHttpAuthorizationType>());
        expect(authorization.name, authorizationName);
      });

      test('| getAuthorization() should return an Empty Map<String, String>',
          () async {
        // Act
        var authorization = await defaultExceptionHandler.getAuthorization();

        // Assert
        expect(authorization, isA<Map<String, String>>());
        expect(authorization.isEmpty, true);
      });
    },
  );
}
