// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lightning_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LightningData extends LightningData {
  @override
  final BuiltList<LightningRecord> records;
  @override
  final String? paginationToken;

  factory _$LightningData([void Function(LightningDataBuilder)? updates]) =>
      (LightningDataBuilder()..update(updates))._build();

  _$LightningData._({required this.records, this.paginationToken}) : super._();
  @override
  LightningData rebuild(void Function(LightningDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LightningDataBuilder toBuilder() => LightningDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LightningData &&
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
    return (newBuiltValueToStringHelper(r'LightningData')
          ..add('records', records)
          ..add('paginationToken', paginationToken))
        .toString();
  }
}

class LightningDataBuilder
    implements Builder<LightningData, LightningDataBuilder> {
  _$LightningData? _$v;

  ListBuilder<LightningRecord>? _records;
  ListBuilder<LightningRecord> get records =>
      _$this._records ??= ListBuilder<LightningRecord>();
  set records(ListBuilder<LightningRecord>? records) =>
      _$this._records = records;

  String? _paginationToken;
  String? get paginationToken => _$this._paginationToken;
  set paginationToken(String? paginationToken) =>
      _$this._paginationToken = paginationToken;

  LightningDataBuilder() {
    LightningData._defaults(this);
  }

  LightningDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _records = $v.records.toBuilder();
      _paginationToken = $v.paginationToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LightningData other) {
    _$v = other as _$LightningData;
  }

  @override
  void update(void Function(LightningDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LightningData build() => _build();

  _$LightningData _build() {
    _$LightningData _$result;
    try {
      _$result = _$v ??
          _$LightningData._(
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
            r'LightningData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
