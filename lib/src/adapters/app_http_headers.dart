import 'dart:convert';

class AppHttpHeaders {
  final Map<String, dynamic> _data;

  const AppHttpHeaders.basic()
      : _data = const <String, dynamic>{'Accept': '*/*'};

  const AppHttpHeaders.basicFormData()
      : _data = const <String, dynamic>{
          'Accept': '*/*',
          'Content-Type': 'multipart/form-data',
        };

  const AppHttpHeaders.basicJson()
      : _data = const <String, dynamic>{
          'Accept': '*/*',
          'Content-Type': 'application/json',
        };

  const AppHttpHeaders.custom(this._data);

  Map<String, dynamic> get data => _data;

  void addAll(Map<String, dynamic> additional) {
    return _data.addAll(additional);
  }

  AppHttpHeaders copyWith({AppHttpHeaders? headers}) {
    return AppHttpHeaders.custom(headers?._data ?? _data);
  }

  String toJson() => jsonEncode(_data);
}
