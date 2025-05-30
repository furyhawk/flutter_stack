// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_range.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TemperatureRange extends TemperatureRange {
  @override
  final int low;
  @override
  final int high;
  @override
  final String unit;

  factory _$TemperatureRange(
          [void Function(TemperatureRangeBuilder)? updates]) =>
      (TemperatureRangeBuilder()..update(updates))._build();

  _$TemperatureRange._(
      {required this.low, required this.high, required this.unit})
      : super._();
  @override
  TemperatureRange rebuild(void Function(TemperatureRangeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TemperatureRangeBuilder toBuilder() =>
      TemperatureRangeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemperatureRange &&
        low == other.low &&
        high == other.high &&
        unit == other.unit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, low.hashCode);
    _$hash = $jc(_$hash, high.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TemperatureRange')
          ..add('low', low)
          ..add('high', high)
          ..add('unit', unit))
        .toString();
  }
}

class TemperatureRangeBuilder
    implements Builder<TemperatureRange, TemperatureRangeBuilder> {
  _$TemperatureRange? _$v;

  int? _low;
  int? get low => _$this._low;
  set low(int? low) => _$this._low = low;

  int? _high;
  int? get high => _$this._high;
  set high(int? high) => _$this._high = high;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  TemperatureRangeBuilder() {
    TemperatureRange._defaults(this);
  }

  TemperatureRangeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _low = $v.low;
      _high = $v.high;
      _unit = $v.unit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TemperatureRange other) {
    _$v = other as _$TemperatureRange;
  }

  @override
  void update(void Function(TemperatureRangeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TemperatureRange build() => _build();

  _$TemperatureRange _build() {
    final _$result = _$v ??
        _$TemperatureRange._(
          low: BuiltValueNullFieldError.checkNotNull(
              low, r'TemperatureRange', 'low'),
          high: BuiltValueNullFieldError.checkNotNull(
              high, r'TemperatureRange', 'high'),
          unit: BuiltValueNullFieldError.checkNotNull(
              unit, r'TemperatureRange', 'unit'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
