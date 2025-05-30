// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wbgt_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WBGTResponse extends WBGTResponse {
  @override
  final int code;
  @override
  final String? errorMsg;
  @override
  final WBGTData? data;

  factory _$WBGTResponse([void Function(WBGTResponseBuilder)? updates]) =>
      (WBGTResponseBuilder()..update(updates))._build();

  _$WBGTResponse._({required this.code, this.errorMsg, this.data}) : super._();
  @override
  WBGTResponse rebuild(void Function(WBGTResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WBGTResponseBuilder toBuilder() => WBGTResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WBGTResponse &&
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
    return (newBuiltValueToStringHelper(r'WBGTResponse')
          ..add('code', code)
          ..add('errorMsg', errorMsg)
          ..add('data', data))
        .toString();
  }
}

class WBGTResponseBuilder
    implements Builder<WBGTResponse, WBGTResponseBuilder> {
  _$WBGTResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _errorMsg;
  String? get errorMsg => _$this._errorMsg;
  set errorMsg(String? errorMsg) => _$this._errorMsg = errorMsg;

  WBGTDataBuilder? _data;
  WBGTDataBuilder get data => _$this._data ??= WBGTDataBuilder();
  set data(WBGTDataBuilder? data) => _$this._data = data;

  WBGTResponseBuilder() {
    WBGTResponse._defaults(this);
  }

  WBGTResponseBuilder get _$this {
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
  void replace(WBGTResponse other) {
    _$v = other as _$WBGTResponse;
  }

  @override
  void update(void Function(WBGTResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WBGTResponse build() => _build();

  _$WBGTResponse _build() {
    _$WBGTResponse _$result;
    try {
      _$result = _$v ??
          _$WBGTResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'WBGTResponse', 'code'),
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
            r'WBGTResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
