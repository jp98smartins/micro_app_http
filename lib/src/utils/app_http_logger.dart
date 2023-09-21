import 'dart:developer' as developer;

import 'enums/app_http_log_colors.dart';

export 'enums/app_http_log_colors.dart';

final class AppHttpLogger {
  static void log(
    String data, {
    StackTrace? stackTrace,
    AppHttpLogColors color = AppHttpLogColors.cyan,
  }) {
    developer.log(
      "\x1B[${color.code}m$data\x1B[0m",
      stackTrace: stackTrace ?? StackTrace.current,
    );
  }
}
