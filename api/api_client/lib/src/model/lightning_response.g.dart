// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lightning_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LightningResponse extends LightningResponse {
  @override
  final int code;
  @override
  final String? errorMsg;
  @override
  final LightningData? data;

  factory _$LightningResponse(
          [void Function(LightningResponseBuilder)? updates]) =>
      (LightningResponseBuilder()..update(updates))._build();

  _$LightningResponse._({required this.code, this.errorMsg, this.data})
      : super._();
  @override
  LightningResponse rebuild(void Function(LightningResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LightningResponseBuilder toBuilder() =>
      LightningResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LightningResponse &&
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
    return (newBuiltValueToStringHelper(r'LightningResponse')
          ..add('code', code)
          ..add('errorMsg', errorMsg)
          ..add('data', data))
        .toString();
  }
}

class LightningResponseBuilder
    implements Builder<LightningResponse, LightningResponseBuilder> {
  _$LightningResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _errorMsg;
  String? get errorMsg => _$this._errorMsg;
  set errorMsg(String? errorMsg) => _$this._errorMsg = errorMsg;

  LightningDataBuilder? _data;
  LightningDataBuilder get data => _$this._data ??= LightningDataBuilder();
  set data(LightningDataBuilder? data) => _$this._data = data;

  LightningResponseBuilder() {
    LightningResponse._defaults(this);
  }

  LightningResponseBuilder get _$this {
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
  void replace(LightningResponse other) {
    _$v = other as _$LightningResponse;
  }

  @override
  void update(void Function(LightningResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LightningResponse build() => _build();

  _$LightningResponse _build() {
    _$LightningResponse _$result;
    try {
      _$result = _$v ??
          _$LightningResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'LightningResponse', 'code'),
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
            r'LightningResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
