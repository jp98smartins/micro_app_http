import 'interfaces/app_http_authorization_interface.dart';

final class DefaultAppHttpAuthorization
    implements AppHttpAuthorizationInterface {
  const DefaultAppHttpAuthorization();

  @override
  AppHttpAuthorizationType get authorizationType =>
      AppHttpAuthorizationType.noAuthorization;

  @override
  Future<Map<String, String>> getAuthorization() async => <String, String>{};
}
