// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_forecast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeneralForecast extends GeneralForecast {
  @override
  final ForecastPeriodGeneral validPeriod;
  @override
  final TemperatureRange temperature;
  @override
  final HumidityRange relativeHumidity;
  @override
  final ForecastInfo forecast;
  @override
  final WindInfo wind;

  factory _$GeneralForecast([void Function(GeneralForecastBuilder)? updates]) =>
      (GeneralForecastBuilder()..update(updates))._build();

  _$GeneralForecast._(
      {required this.validPeriod,
      required this.temperature,
      required this.relativeHumidity,
      required this.forecast,
      required this.wind})
      : super._();
  @override
  GeneralForecast rebuild(void Function(GeneralForecastBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneralForecastBuilder toBuilder() => GeneralForecastBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeneralForecast &&
        validPeriod == other.validPeriod &&
        temperature == other.temperature &&
        relativeHumidity == other.relativeHumidity &&
        forecast == other.forecast &&
        wind == other.wind;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, validPeriod.hashCode);
    _$hash = $jc(_$hash, temperature.hashCode);
    _$hash = $jc(_$hash, relativeHumidity.hashCode);
    _$hash = $jc(_$hash, forecast.hashCode);
    _$hash = $jc(_$hash, wind.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeneralForecast')
          ..add('validPeriod', validPeriod)
          ..add('temperature', temperature)
          ..add('relativeHumidity', relativeHumidity)
          ..add('forecast', forecast)
          ..add('wind', wind))
        .toString();
  }
}

class GeneralForecastBuilder
    implements Builder<GeneralForecast, GeneralForecastBuilder> {
  _$GeneralForecast? _$v;

  ForecastPeriodGeneralBuilder? _validPeriod;
  ForecastPeriodGeneralBuilder get validPeriod =>
      _$this._validPeriod ??= ForecastPeriodGeneralBuilder();
  set validPeriod(ForecastPeriodGeneralBuilder? validPeriod) =>
      _$this._validPeriod = validPeriod;

  TemperatureRangeBuilder? _temperature;
  TemperatureRangeBuilder get temperature =>
      _$this._temperature ??= TemperatureRangeBuilder();
  set temperature(TemperatureRangeBuilder? temperature) =>
      _$this._temperature = temperature;

  HumidityRangeBuilder? _relativeHumidity;
  HumidityRangeBuilder get relativeHumidity =>
      _$this._relativeHumidity ??= HumidityRangeBuilder();
  set relativeHumidity(HumidityRangeBuilder? relativeHumidity) =>
      _$this._relativeHumidity = relativeHumidity;

  ForecastInfoBuilder? _forecast;
  ForecastInfoBuilder get forecast =>
      _$this._forecast ??= ForecastInfoBuilder();
  set forecast(ForecastInfoBuilder? forecast) => _$this._forecast = forecast;

  WindInfoBuilder? _wind;
  WindInfoBuilder get wind => _$this._wind ??= WindInfoBuilder();
  set wind(WindInfoBuilder? wind) => _$this._wind = wind;

  GeneralForecastBuilder() {
    GeneralForecast._defaults(this);
  }

  GeneralForecastBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _validPeriod = $v.validPeriod.toBuilder();
      _temperature = $v.temperature.toBuilder();
      _relativeHumidity = $v.relativeHumidity.toBuilder();
      _forecast = $v.forecast.toBuilder();
      _wind = $v.wind.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneralForecast other) {
    _$v = other as _$GeneralForecast;
  }

  @override
  void update(void Function(GeneralForecastBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeneralForecast build() => _build();

  _$GeneralForecast _build() {
    _$GeneralForecast _$result;
    try {
      _$result = _$v ??
          _$GeneralForecast._(
            validPeriod: validPeriod.build(),
            temperature: temperature.build(),
            relativeHumidity: relativeHumidity.build(),
            forecast: forecast.build(),
            wind: wind.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'validPeriod';
        validPeriod.build();
        _$failedField = 'temperature';
        temperature.build();
        _$failedField = 'relativeHumidity';
        relativeHumidity.build();
        _$failedField = 'forecast';
        forecast.build();
        _$failedField = 'wind';
        wind.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GeneralForecast', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
