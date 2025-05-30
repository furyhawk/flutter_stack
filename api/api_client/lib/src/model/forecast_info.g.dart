// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ForecastInfo extends ForecastInfo {
  @override
  final String? code;
  @override
  final String text;

  factory _$ForecastInfo([void Function(ForecastInfoBuilder)? updates]) =>
      (ForecastInfoBuilder()..update(updates))._build();

  _$ForecastInfo._({this.code, required this.text}) : super._();
  @override
  ForecastInfo rebuild(void Function(ForecastInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForecastInfoBuilder toBuilder() => ForecastInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForecastInfo && code == other.code && text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForecastInfo')
          ..add('code', code)
          ..add('text', text))
        .toString();
  }
}

class ForecastInfoBuilder
    implements Builder<ForecastInfo, ForecastInfoBuilder> {
  _$ForecastInfo? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ForecastInfoBuilder() {
    ForecastInfo._defaults(this);
  }

  ForecastInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForecastInfo other) {
    _$v = other as _$ForecastInfo;
  }

  @override
  void update(void Function(ForecastInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForecastInfo build() => _build();

  _$ForecastInfo _build() {
    final _$result = _$v ??
        _$ForecastInfo._(
          code: code,
          text: BuiltValueNullFieldError.checkNotNull(
              text, r'ForecastInfo', 'text'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
