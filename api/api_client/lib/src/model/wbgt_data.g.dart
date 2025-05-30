// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wbgt_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WBGTData extends WBGTData {
  @override
  final BuiltList<WBGTRecord> records;
  @override
  final String? paginationToken;

  factory _$WBGTData([void Function(WBGTDataBuilder)? updates]) =>
      (WBGTDataBuilder()..update(updates))._build();

  _$WBGTData._({required this.records, this.paginationToken}) : super._();
  @override
  WBGTData rebuild(void Function(WBGTDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WBGTDataBuilder toBuilder() => WBGTDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WBGTData &&
        records == other.records &&
        paginationToken == other.paginationToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, records.hashCode);
    _$hash = $jc(_$hash, paginationToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WBGTData')
          ..add('records', records)
          ..add('paginationToken', paginationToken))
        .toString();
  }
}

class WBGTDataBuilder implements Builder<WBGTData, WBGTDataBuilder> {
  _$WBGTData? _$v;

  ListBuilder<WBGTRecord>? _records;
  ListBuilder<WBGTRecord> get records =>
      _$this._records ??= ListBuilder<WBGTRecord>();
  set records(ListBuilder<WBGTRecord>? records) => _$this._records = records;

  String? _paginationToken;
  String? get paginationToken => _$this._paginationToken;
  set paginationToken(String? paginationToken) =>
      _$this._paginationToken = paginationToken;

  WBGTDataBuilder() {
    WBGTData._defaults(this);
  }

  WBGTDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _records = $v.records.toBuilder();
      _paginationToken = $v.paginationToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WBGTData other) {
    _$v = other as _$WBGTData;
  }

  @override
  void update(void Function(WBGTDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WBGTData build() => _build();

  _$WBGTData _build() {
    _$WBGTData _$result;
    try {
      _$result = _$v ??
          _$WBGTData._(
            records: records.build(),
            paginationToken: paginationToken,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'records';
        records.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WBGTData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
