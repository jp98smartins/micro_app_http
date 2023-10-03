import 'dart:io';

import 'package:flutter/services.dart';

import 'app_http_logger.dart';

final class AppHttpCertificatePinning {
  /// Generic HttpClient.
  ///
  ///
  /// This will prevent certificate exceptions.
  static HttpClient generic() => HttpClient()
    ..badCertificateCallback =
        (X509Certificate certificate, String host, int port) => true;

  static late final ByteData certificate;
  static late final String? password;

  /// Loads the certificate on the memory to pin all the Http Requests.
  ///
  ///
  /// Call the [loadCertificate] method on the [main.dart] file, before the
  /// [runApp] execution.
  ///
  /// The path for the certificate should be the absolute path, like this,
  /// eg.: ["assets/certificates/production.pem"].
  ///
  /// This will only work as cross platform if the certificate has the [.pem]
  /// extension.
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
  ///
  /// This will prevent the app from "Man In The Middle" attacks.
  ///
  /// First, take a look on the [loadCertificate] method to understand how to
  /// load the certificate on the device's memory to use this feature.
  static HttpClient pinned() {
    final securityContext = SecurityContext();
    securityContext.setTrustedCertificatesBytes(
      certificate.buffer.asUint8List(),
      password: password,
    );

    return HttpClient(context: securityContext);
  }
}
