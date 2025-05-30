// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lightning_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LightningRecord extends LightningRecord {
  @override
  final String datetime;
  @override
  final BuiltMap<String, JsonObject?> item;
  @override
  final DateTime? updatedTimestamp;

  factory _$LightningRecord([void Function(LightningRecordBuilder)? updates]) =>
      (LightningRecordBuilder()..update(updates))._build();

  _$LightningRecord._(
      {required this.datetime, required this.item, this.updatedTimestamp})
      : super._();
  @override
  LightningRecord rebuild(void Function(LightningRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LightningRecordBuilder toBuilder() => LightningRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LightningRecord &&
        datetime == other.datetime &&
        item == other.item &&
        updatedTimestamp == other.updatedTimestamp;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, datetime.hashCode);
    _$hash = $jc(_$hash, item.hashCode);
    _$hash = $jc(_$hash, updatedTimestamp.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LightningRecord')
          ..add('datetime', datetime)
          ..add('item', item)
          ..add('updatedTimestamp', updatedTimestamp))
        .toString();
  }
}

class LightningRecordBuilder
    implements Builder<LightningRecord, LightningRecordBuilder> {
  _$LightningRecord? _$v;

  String? _datetime;
  String? get datetime => _$this._datetime;
  set datetime(String? datetime) => _$this._datetime = datetime;

  MapBuilder<String, JsonObject?>? _item;
  MapBuilder<String, JsonObject?> get item =>
      _$this._item ??= MapBuilder<String, JsonObject?>();
  set item(MapBuilder<String, JsonObject?>? item) => _$this._item = item;

  DateTime? _updatedTimestamp;
  DateTime? get updatedTimestamp => _$this._updatedTimestamp;
  set updatedTimestamp(DateTime? updatedTimestamp) =>
      _$this._updatedTimestamp = updatedTimestamp;

  LightningRecordBuilder() {
    LightningRecord._defaults(this);
  }

  LightningRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _datetime = $v.datetime;
      _item = $v.item.toBuilder();
      _updatedTimestamp = $v.updatedTimestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LightningRecord other) {
    _$v = other as _$LightningRecord;
  }

  @override
  void update(void Function(LightningRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LightningRecord build() => _build();

  _$LightningRecord _build() {
    _$LightningRecord _$result;
    try {
      _$result = _$v ??
          _$LightningRecord._(
            datetime: BuiltValueNullFieldError.checkNotNull(
                datetime, r'LightningRecord', 'datetime'),
            item: item.build(),
            updatedTimestamp: updatedTimestamp,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'item';
        item.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'LightningRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
