import 'dart:convert';

class AppHttpQueryParams {
  final Map<String, dynamic> _data;

  const AppHttpQueryParams.custom(this._data);

  Map<String, dynamic> get data => _data;

  AppHttpQueryParams copyWith({AppHttpQueryParams? queryParams}) {
    return AppHttpQueryParams.custom(queryParams?._data ?? _data);
  }

  String toJson() => jsonEncode(_data);
}
