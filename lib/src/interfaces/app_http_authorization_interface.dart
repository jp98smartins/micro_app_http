import '../utils/enums/app_http_authorization_type.dart';

export '../utils/enums/app_http_authorization_type.dart';

abstract class AppHttpAuthorizationInterface {
  AppHttpAuthorizationType get authorizationType;

  Future<Map<String, String>> getAuthorization();
}
