// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'humidity_range.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HumidityRange extends HumidityRange {
  @override
  final int low;
  @override
  final int high;
  @override
  final String unit;

  factory _$HumidityRange([void Function(HumidityRangeBuilder)? updates]) =>
      (HumidityRangeBuilder()..update(updates))._build();

  _$HumidityRange._({required this.low, required this.high, required this.unit})
      : super._();
  @override
  HumidityRange rebuild(void Function(HumidityRangeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HumidityRangeBuilder toBuilder() => HumidityRangeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HumidityRange &&
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
    return (newBuiltValueToStringHelper(r'HumidityRange')
          ..add('low', low)
          ..add('high', high)
          ..add('unit', unit))
        .toString();
  }
}

class HumidityRangeBuilder
    implements Builder<HumidityRange, HumidityRangeBuilder> {
  _$HumidityRange? _$v;

  int? _low;
  int? get low => _$this._low;
  set low(int? low) => _$this._low = low;

  int? _high;
  int? get high => _$this._high;
  set high(int? high) => _$this._high = high;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  HumidityRangeBuilder() {
    HumidityRange._defaults(this);
  }

  HumidityRangeBuilder get _$this {
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
  void replace(HumidityRange other) {
    _$v = other as _$HumidityRange;
  }

  @override
  void update(void Function(HumidityRangeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HumidityRange build() => _build();

  _$HumidityRange _build() {
    final _$result = _$v ??
        _$HumidityRange._(
          low: BuiltValueNullFieldError.checkNotNull(
              low, r'HumidityRange', 'low'),
          high: BuiltValueNullFieldError.checkNotNull(
              high, r'HumidityRange', 'high'),
          unit: BuiltValueNullFieldError.checkNotNull(
              unit, r'HumidityRange', 'unit'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
