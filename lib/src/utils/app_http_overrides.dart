import 'dart:io';

import 'package:flutter/services.dart';

import 'app_http_logger.dart';

final class AppHttpOverrides {
  /// Generic HttpClient.
  ///
  /// This will prevent certificate exceptions.
  static HttpClient generic() => HttpClient()
    ..badCertificateCallback =
        (X509Certificate certificate, String host, int port) => true;

  static late final ByteData certificate;
  static late final String? password;

  /// Loads the certificate on the memory to pin all the Http Requests.
  ///
  /// You'll need to pass the absolute path for the certificate, like this:
  /// eg.: ["assets/certificates/production.pem"].
  ///
  /// This will only work cross platform if the certificate has the [.pem] extension.
  static Future loadCertificate(
    String certificatePath, {
    String? password,
  }) async {
    try {
      certificate = await rootBundle.load(certificatePath);
      password = password;
    } catch (error, stackTrace) {
      AppHttpLogger.log(
        '''
=====> [ START CERTIFICATE ERROR ] +++++++++++++++++++++++++++++++++++++++++++++
Certificate Path: $certificatePath

 ---

Error: ${error.toString()}
StackTrace: $stackTrace
=====> [ END CERTIFICATE ERROR ] -----------------------------------------------''',
        color: AppHttpLogColors.brightRed,
      );
    }
  }

  /// Pinned HttpClient.
  ///
  /// This will prevent the app from "Man In The Middle" attacks.
  /// In order to work you'll need to call the [loadCertificate] method on the
  /// [main.dart] file, before the [runApp()] execution.
  static HttpClient pinned() {
    final securityContext = SecurityContext();
    securityContext.setTrustedCertificatesBytes(
      certificate.buffer.asUint8List(),
      password: password,
    );

    return HttpClient(context: securityContext);
  }
}
