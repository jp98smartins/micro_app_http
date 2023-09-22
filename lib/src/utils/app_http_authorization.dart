import 'enums/app_http_authorization_type.dart';

abstract class AppHttpAuthorizationInterface {
  AppHttpAuthorizationType get authorizationType;

  Future<Map<String, String>> getAuthorization();
}

final class NoAuthAppHttpAuthorization
    implements AppHttpAuthorizationInterface {
  const NoAuthAppHttpAuthorization();

  @override
  AppHttpAuthorizationType get authorizationType =>
      AppHttpAuthorizationType.noAuthorization;

  @override
  Future<Map<String, String>> getAuthorization() async => <String, String>{};
}
