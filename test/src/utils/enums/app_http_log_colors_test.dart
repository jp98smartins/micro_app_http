import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_http/src/utils/enums/app_http_log_colors.dart';

void main() {
  group(
    'AppHttpLogColors Codes',
    () {
      test('| Black should have code: 30', () {
        // Arrange
        const code = 30;

        // Act
        var blackColor = AppHttpLogColors.black;

        // Assert
        expect(code, blackColor.code);
      });

      test('| Blue should have code: 34', () {
        // Arrange
        const code = 34;

        // Act
        var blueColor = AppHttpLogColors.blue;

        // Assert
        expect(code, blueColor.code);
      });

      test('| Bright Black should have code: 90', () {
        // Arrange
        const code = 90;

        // Act
        var brightBlackColor = AppHttpLogColors.brightBlack;

        // Assert
        expect(code, brightBlackColor.code);
      });

      test('| Bright Blue should have code: 94', () {
        // Arrange
        const code = 94;

        // Act
        var brightBlueColor = AppHttpLogColors.brightBlue;

        // Assert
        expect(code, brightBlueColor.code);
      });

      test('| Bright Cyan should have code: 96', () {
        // Arrange
        const code = 96;

        // Act
        var brightCyanColor = AppHttpLogColors.brightCyan;

        // Assert
        expect(code, brightCyanColor.code);
      });

      test('| Bright Green should have code: 92', () {
        // Arrange
        const code = 92;

        // Act
        var brightGreenColor = AppHttpLogColors.brightGreen;

        // Assert
        expect(code, brightGreenColor.code);
      });

      test('| Bright Magenta should have code: 95', () {
        // Arrange
        const code = 95;

        // Act
        var brightMagentaColor = AppHttpLogColors.brightMagenta;

        // Assert
        expect(code, brightMagentaColor.code);
      });

      test('| Bright Red should have code: 91', () {
        // Arrange
        const code = 91;

        // Act
        var brightRedColor = AppHttpLogColors.brightRed;

        // Assert
        expect(code, brightRedColor.code);
      });

      test('| Bright White should have code: 97', () {
        // Arrange
        const code = 97;

        // Act
        var brightWhiteColor = AppHttpLogColors.brightWhite;

        // Assert
        expect(code, brightWhiteColor.code);
      });

      test('| Bright Yellow should have code: 93', () {
        // Arrange
        const code = 93;

        // Act
        var brightYellowColor = AppHttpLogColors.brightYellow;

        // Assert
        expect(code, brightYellowColor.code);
      });

      test('| Cyan should have code: 36', () {
        // Arrange
        const code = 36;

        // Act
        var cyanColor = AppHttpLogColors.cyan;

        // Assert
        expect(code, cyanColor.code);
      });

      test('| Green should have code: 32', () {
        // Arrange
        const code = 32;

        // Act
        var greenColor = AppHttpLogColors.green;

        // Assert
        expect(code, greenColor.code);
      });

      test('| Magenta should have code: 35', () {
        // Arrange
        const code = 35;

        // Act
        var magentaColor = AppHttpLogColors.magenta;

        // Assert
        expect(code, magentaColor.code);
      });

      test('| Red should have code: 31', () {
        // Arrange
        const code = 31;

        // Act
        var redColor = AppHttpLogColors.red;

        // Assert
        expect(code, redColor.code);
      });

      test('| White should have code: 37', () {
        // Arrange
        const code = 37;

        // Act
        var whiteColor = AppHttpLogColors.white;

        // Assert
        expect(code, whiteColor.code);
      });

      test('| Yellow should have code: 33', () {
        // Arrange
        const code = 33;

        // Act
        var yellowColor = AppHttpLogColors.yellow;

        // Assert
        expect(code, yellowColor.code);
      });
    },
  );
}
