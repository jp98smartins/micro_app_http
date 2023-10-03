import '../enums/app_http_authorization_type.dart';

export '../enums/app_http_authorization_type.dart';

abstract class AppHttpAuthorizationInterface {
  AppHttpAuthorizationType get authorizationType;

  Future<Map<String, String>> getAuthorization();
}
