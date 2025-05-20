// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Forecast extends Forecast {
  @override
  final String area;
  @override
  final String forecast;

  factory _$Forecast([void Function(ForecastBuilder)? updates]) =>
      (new ForecastBuilder()..update(updates))._build();

  _$Forecast._({required this.area, required this.forecast}) : super._() {
    BuiltValueNullFieldError.checkNotNull(area, r'Forecast', 'area');
    BuiltValueNullFieldError.checkNotNull(forecast, r'Forecast', 'forecast');
  }

  @override
  Forecast rebuild(void Function(ForecastBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForecastBuilder toBuilder() => new ForecastBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast &&
        area == other.area &&
        forecast == other.forecast;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, area.hashCode);
    _$hash = $jc(_$hash, forecast.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast')
          ..add('area', area)
          ..add('forecast', forecast))
        .toString();
  }
}

class ForecastBuilder implements Builder<Forecast, ForecastBuilder> {
  _$Forecast? _$v;

  String? _area;
  String? get area => _$this._area;
  set area(String? area) => _$this._area = area;

  String? _forecast;
  String? get forecast => _$this._forecast;
  set forecast(String? forecast) => _$this._forecast = forecast;

  ForecastBuilder() {
    Forecast._defaults(this);
  }

  ForecastBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _area = $v.area;
      _forecast = $v.forecast;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Forecast other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast;
  }

  @override
  void update(void Function(ForecastBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast build() => _build();

  _$Forecast _build() {
    final _$result = _$v ??
        new _$Forecast._(
          area:
              BuiltValueNullFieldError.checkNotNull(area, r'Forecast', 'area'),
          forecast: BuiltValueNullFieldError.checkNotNull(
              forecast, r'Forecast', 'forecast'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
