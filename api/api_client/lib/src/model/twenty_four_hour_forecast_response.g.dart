// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twenty_four_hour_forecast_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TwentyFourHourForecastResponse extends TwentyFourHourForecastResponse {
  @override
  final int code;
  @override
  final String? errorMsg;
  @override
  final TwentyFourHourForecastData? data;

  factory _$TwentyFourHourForecastResponse(
          [void Function(TwentyFourHourForecastResponseBuilder)? updates]) =>
      (TwentyFourHourForecastResponseBuilder()..update(updates))._build();

  _$TwentyFourHourForecastResponse._(
      {required this.code, this.errorMsg, this.data})
      : super._();
  @override
  TwentyFourHourForecastResponse rebuild(
          void Function(TwentyFourHourForecastResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TwentyFourHourForecastResponseBuilder toBuilder() =>
      TwentyFourHourForecastResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TwentyFourHourForecastResponse &&
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
    return (newBuiltValueToStringHelper(r'TwentyFourHourForecastResponse')
          ..add('code', code)
          ..add('errorMsg', errorMsg)
          ..add('data', data))
        .toString();
  }
}

class TwentyFourHourForecastResponseBuilder
    implements
        Builder<TwentyFourHourForecastResponse,
            TwentyFourHourForecastResponseBuilder> {
  _$TwentyFourHourForecastResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _errorMsg;
  String? get errorMsg => _$this._errorMsg;
  set errorMsg(String? errorMsg) => _$this._errorMsg = errorMsg;

  TwentyFourHourForecastDataBuilder? _data;
  TwentyFourHourForecastDataBuilder get data =>
      _$this._data ??= TwentyFourHourForecastDataBuilder();
  set data(TwentyFourHourForecastDataBuilder? data) => _$this._data = data;

  TwentyFourHourForecastResponseBuilder() {
    TwentyFourHourForecastResponse._defaults(this);
  }

  TwentyFourHourForecastResponseBuilder get _$this {
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
  void replace(TwentyFourHourForecastResponse other) {
    _$v = other as _$TwentyFourHourForecastResponse;
  }

  @override
  void update(void Function(TwentyFourHourForecastResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TwentyFourHourForecastResponse build() => _build();

  _$TwentyFourHourForecastResponse _build() {
    _$TwentyFourHourForecastResponse _$result;
    try {
      _$result = _$v ??
          _$TwentyFourHourForecastResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'TwentyFourHourForecastResponse', 'code'),
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
            r'TwentyFourHourForecastResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
