abstract base class Constants {
  static const connectionTimeout = Duration(seconds: 17);
  static const receiveTimeout = Duration(seconds: 17);
  static const sendTimeout = Duration(seconds: 17);
  static const retries = 3;
  static const delayBetweenRetries = Duration(seconds: 3);
}
