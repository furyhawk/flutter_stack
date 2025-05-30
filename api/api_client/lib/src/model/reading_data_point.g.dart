// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_data_point.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReadingDataPoint extends ReadingDataPoint {
  @override
  final String stationId;
  @override
  final num value;

  factory _$ReadingDataPoint(
          [void Function(ReadingDataPointBuilder)? updates]) =>
      (ReadingDataPointBuilder()..update(updates))._build();

  _$ReadingDataPoint._({required this.stationId, required this.value})
      : super._();
  @override
  ReadingDataPoint rebuild(void Function(ReadingDataPointBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReadingDataPointBuilder toBuilder() =>
      ReadingDataPointBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReadingDataPoint &&
        stationId == other.stationId &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, stationId.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReadingDataPoint')
          ..add('stationId', stationId)
          ..add('value', value))
        .toString();
  }
}

class ReadingDataPointBuilder
    implements Builder<ReadingDataPoint, ReadingDataPointBuilder> {
  _$ReadingDataPoint? _$v;

  String? _stationId;
  String? get stationId => _$this._stationId;
  set stationId(String? stationId) => _$this._stationId = stationId;

  num? _value;
  num? get value => _$this._value;
  set value(num? value) => _$this._value = value;

  ReadingDataPointBuilder() {
    ReadingDataPoint._defaults(this);
  }

  ReadingDataPointBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stationId = $v.stationId;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReadingDataPoint other) {
    _$v = other as _$ReadingDataPoint;
  }

  @override
  void update(void Function(ReadingDataPointBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReadingDataPoint build() => _build();

  _$ReadingDataPoint _build() {
    final _$result = _$v ??
        _$ReadingDataPoint._(
          stationId: BuiltValueNullFieldError.checkNotNull(
              stationId, r'ReadingDataPoint', 'stationId'),
          value: BuiltValueNullFieldError.checkNotNull(
              value, r'ReadingDataPoint', 'value'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
