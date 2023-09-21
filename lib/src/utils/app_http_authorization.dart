import 'dart:convert';

sealed class AppHttpAuthorization {
  Map<String, String> get authorization;
}

enum AppHttpApiKeyAuthorizationType {
  headers,
  queryParams;
}

class AppHttpApiKeyAuthorization implements AppHttpAuthorization {
  final String key;
  final AppHttpApiKeyAuthorizationType type;
  final String value;

  const AppHttpApiKeyAuthorization({
    required this.key,
    required this.type,
    required this.value,
  });

  @override
  Map<String, String> get authorization => {key: value};
}

class AppHttpBasicAuthAuthorization implements AppHttpAuthorization {
  final String password;
  final String username;

  const AppHttpBasicAuthAuthorization({
    required this.password,
    required this.username,
  });

  @override
  Map<String, String> get authorization {
    final auth = '$username:$password';
    final encodedAuth = base64.encode(utf8.encode(auth));

    return {'Authorization': 'Basic $encodedAuth'};
  }
}

class AppHttpBearerTokenAuthorization implements AppHttpAuthorization {
  final String token;

  const AppHttpBearerTokenAuthorization({required this.token});

  @override
  Map<String, String> get authorization => {'Authorization': 'Bearer $token'};
}

class AppHttpNoAuthAuthorization implements AppHttpAuthorization {
  const AppHttpNoAuthAuthorization();

  @override
  Map<String, String> get authorization => {};
}
