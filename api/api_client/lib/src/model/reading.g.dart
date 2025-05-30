// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Reading extends Reading {
  @override
  final DateTime timestamp;
  @override
  final BuiltList<ReadingDataPoint> data;

  factory _$Reading([void Function(ReadingBuilder)? updates]) =>
      (ReadingBuilder()..update(updates))._build();

  _$Reading._({required this.timestamp, required this.data}) : super._();
  @override
  Reading rebuild(void Function(ReadingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReadingBuilder toBuilder() => ReadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reading &&
        timestamp == other.timestamp &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Reading')
          ..add('timestamp', timestamp)
          ..add('data', data))
        .toString();
  }
}

class ReadingBuilder implements Builder<Reading, ReadingBuilder> {
  _$Reading? _$v;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  ListBuilder<ReadingDataPoint>? _data;
  ListBuilder<ReadingDataPoint> get data =>
      _$this._data ??= ListBuilder<ReadingDataPoint>();
  set data(ListBuilder<ReadingDataPoint>? data) => _$this._data = data;

  ReadingBuilder() {
    Reading._defaults(this);
  }

  ReadingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _timestamp = $v.timestamp;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Reading other) {
    _$v = other as _$Reading;
  }

  @override
  void update(void Function(ReadingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Reading build() => _build();

  _$Reading _build() {
    _$Reading _$result;
    try {
      _$result = _$v ??
          _$Reading._(
            timestamp: BuiltValueNullFieldError.checkNotNull(
                timestamp, r'Reading', 'timestamp'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'Reading', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
