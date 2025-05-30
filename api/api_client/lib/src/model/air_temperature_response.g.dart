// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_temperature_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AirTemperatureResponse extends AirTemperatureResponse {
  @override
  final int code;
  @override
  final String? errorMsg;
  @override
  final AirTemperatureData? data;

  factory _$AirTemperatureResponse(
          [void Function(AirTemperatureResponseBuilder)? updates]) =>
      (AirTemperatureResponseBuilder()..update(updates))._build();

  _$AirTemperatureResponse._({required this.code, this.errorMsg, this.data})
      : super._();
  @override
  AirTemperatureResponse rebuild(
          void Function(AirTemperatureResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AirTemperatureResponseBuilder toBuilder() =>
      AirTemperatureResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AirTemperatureResponse &&
        code == other.code &&
        errorMsg == other.errorMsg &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, errorMsg.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AirTemperatureResponse')
          ..add('code', code)
          ..add('errorMsg', errorMsg)
          ..add('data', data))
        .toString();
  }
}

class AirTemperatureResponseBuilder
    implements Builder<AirTemperatureResponse, AirTemperatureResponseBuilder> {
  _$AirTemperatureResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _errorMsg;
  String? get errorMsg => _$this._errorMsg;
  set errorMsg(String? errorMsg) => _$this._errorMsg = errorMsg;

  AirTemperatureDataBuilder? _data;
  AirTemperatureDataBuilder get data =>
      _$this._data ??= AirTemperatureDataBuilder();
  set data(AirTemperatureDataBuilder? data) => _$this._data = data;

  AirTemperatureResponseBuilder() {
    AirTemperatureResponse._defaults(this);
  }

  AirTemperatureResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _errorMsg = $v.errorMsg;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AirTemperatureResponse other) {
    _$v = other as _$AirTemperatureResponse;
  }

  @override
  void update(void Function(AirTemperatureResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AirTemperatureResponse build() => _build();

  _$AirTemperatureResponse _build() {
    _$AirTemperatureResponse _$result;
    try {
      _$result = _$v ??
          _$AirTemperatureResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'AirTemperatureResponse', 'code'),
            errorMsg: errorMsg,
            data: _data?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AirTemperatureResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
