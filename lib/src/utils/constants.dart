abstract base class Constants {
  static const connectionTimeout = Duration(seconds: 11);
  static const delayBetweenRetries = Duration(seconds: 3);
  static const receiveTimeout = Duration(seconds: 11);
  static const retries = 1;
  static const sendTimeout = Duration(seconds: 11);
  static const basicHeaders = {
    'accept': '*/*',
    'content-type': 'application/json',
  };
}
