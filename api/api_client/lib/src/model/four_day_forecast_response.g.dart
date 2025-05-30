// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'four_day_forecast_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FourDayForecastResponse extends FourDayForecastResponse {
  @override
  final int code;
  @override
  final String? errorMsg;
  @override
  final FourDayForecastData? data;

  factory _$FourDayForecastResponse(
          [void Function(FourDayForecastResponseBuilder)? updates]) =>
      (FourDayForecastResponseBuilder()..update(updates))._build();

  _$FourDayForecastResponse._({required this.code, this.errorMsg, this.data})
      : super._();
  @override
  FourDayForecastResponse rebuild(
          void Function(FourDayForecastResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FourDayForecastResponseBuilder toBuilder() =>
      FourDayForecastResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FourDayForecastResponse &&
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
    return (newBuiltValueToStringHelper(r'FourDayForecastResponse')
          ..add('code', code)
          ..add('errorMsg', errorMsg)
          ..add('data', data))
        .toString();
  }
}

class FourDayForecastResponseBuilder
    implements
        Builder<FourDayForecastResponse, FourDayForecastResponseBuilder> {
  _$FourDayForecastResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _errorMsg;
  String? get errorMsg => _$this._errorMsg;
  set errorMsg(String? errorMsg) => _$this._errorMsg = errorMsg;

  FourDayForecastDataBuilder? _data;
  FourDayForecastDataBuilder get data =>
      _$this._data ??= FourDayForecastDataBuilder();
  set data(FourDayForecastDataBuilder? data) => _$this._data = data;

  FourDayForecastResponseBuilder() {
    FourDayForecastResponse._defaults(this);
  }

  FourDayForecastResponseBuilder get _$this {
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
  void replace(FourDayForecastResponse other) {
    _$v = other as _$FourDayForecastResponse;
  }

  @override
  void update(void Function(FourDayForecastResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FourDayForecastResponse build() => _build();

  _$FourDayForecastResponse _build() {
    _$FourDayForecastResponse _$result;
    try {
      _$result = _$v ??
          _$FourDayForecastResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'FourDayForecastResponse', 'code'),
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
            r'FourDayForecastResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
