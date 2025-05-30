// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_direction_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WindDirectionResponse extends WindDirectionResponse {
  @override
  final int code;
  @override
  final String? errorMsg;
  @override
  final WindDirectionData? data;

  factory _$WindDirectionResponse(
          [void Function(WindDirectionResponseBuilder)? updates]) =>
      (WindDirectionResponseBuilder()..update(updates))._build();

  _$WindDirectionResponse._({required this.code, this.errorMsg, this.data})
      : super._();
  @override
  WindDirectionResponse rebuild(
          void Function(WindDirectionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WindDirectionResponseBuilder toBuilder() =>
      WindDirectionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WindDirectionResponse &&
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
    return (newBuiltValueToStringHelper(r'WindDirectionResponse')
          ..add('code', code)
          ..add('errorMsg', errorMsg)
          ..add('data', data))
        .toString();
  }
}

class WindDirectionResponseBuilder
    implements Builder<WindDirectionResponse, WindDirectionResponseBuilder> {
  _$WindDirectionResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _errorMsg;
  String? get errorMsg => _$this._errorMsg;
  set errorMsg(String? errorMsg) => _$this._errorMsg = errorMsg;

  WindDirectionDataBuilder? _data;
  WindDirectionDataBuilder get data =>
      _$this._data ??= WindDirectionDataBuilder();
  set data(WindDirectionDataBuilder? data) => _$this._data = data;

  WindDirectionResponseBuilder() {
    WindDirectionResponse._defaults(this);
  }

  WindDirectionResponseBuilder get _$this {
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
  void replace(WindDirectionResponse other) {
    _$v = other as _$WindDirectionResponse;
  }

  @override
  void update(void Function(WindDirectionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WindDirectionResponse build() => _build();

  _$WindDirectionResponse _build() {
    _$WindDirectionResponse _$result;
    try {
      _$result = _$v ??
          _$WindDirectionResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'WindDirectionResponse', 'code'),
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
            r'WindDirectionResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
