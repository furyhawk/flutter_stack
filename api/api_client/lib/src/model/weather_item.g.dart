// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WeatherItem extends WeatherItem {
  @override
  final DateTime updateTimestamp;
  @override
  final DateTime timestamp;
  @override
  final ForecastPeriod validPeriod;
  @override
  final BuiltList<Forecast> forecasts;

  factory _$WeatherItem([void Function(WeatherItemBuilder)? updates]) =>
      (new WeatherItemBuilder()..update(updates))._build();

  _$WeatherItem._(
      {required this.updateTimestamp,
      required this.timestamp,
      required this.validPeriod,
      required this.forecasts})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        updateTimestamp, r'WeatherItem', 'updateTimestamp');
    BuiltValueNullFieldError.checkNotNull(
        timestamp, r'WeatherItem', 'timestamp');
    BuiltValueNullFieldError.checkNotNull(
        validPeriod, r'WeatherItem', 'validPeriod');
    BuiltValueNullFieldError.checkNotNull(
        forecasts, r'WeatherItem', 'forecasts');
  }

  @override
  WeatherItem rebuild(void Function(WeatherItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherItemBuilder toBuilder() => new WeatherItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherItem &&
        updateTimestamp == other.updateTimestamp &&
        timestamp == other.timestamp &&
        validPeriod == other.validPeriod &&
        forecasts == other.forecasts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, updateTimestamp.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, validPeriod.hashCode);
    _$hash = $jc(_$hash, forecasts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherItem')
          ..add('updateTimestamp', updateTimestamp)
          ..add('timestamp', timestamp)
          ..add('validPeriod', validPeriod)
          ..add('forecasts', forecasts))
        .toString();
  }
}

class WeatherItemBuilder implements Builder<WeatherItem, WeatherItemBuilder> {
  _$WeatherItem? _$v;

  DateTime? _updateTimestamp;
  DateTime? get updateTimestamp => _$this._updateTimestamp;
  set updateTimestamp(DateTime? updateTimestamp) =>
      _$this._updateTimestamp = updateTimestamp;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  ForecastPeriodBuilder? _validPeriod;
  ForecastPeriodBuilder get validPeriod =>
      _$this._validPeriod ??= new ForecastPeriodBuilder();
  set validPeriod(ForecastPeriodBuilder? validPeriod) =>
      _$this._validPeriod = validPeriod;

  ListBuilder<Forecast>? _forecasts;
  ListBuilder<Forecast> get forecasts =>
      _$this._forecasts ??= new ListBuilder<Forecast>();
  set forecasts(ListBuilder<Forecast>? forecasts) =>
      _$this._forecasts = forecasts;

  WeatherItemBuilder() {
    WeatherItem._defaults(this);
  }

  WeatherItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _updateTimestamp = $v.updateTimestamp;
      _timestamp = $v.timestamp;
      _validPeriod = $v.validPeriod.toBuilder();
      _forecasts = $v.forecasts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherItem;
  }

  @override
  void update(void Function(WeatherItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherItem build() => _build();

  _$WeatherItem _build() {
    _$WeatherItem _$result;
    try {
      _$result = _$v ??
          new _$WeatherItem._(
            updateTimestamp: BuiltValueNullFieldError.checkNotNull(
                updateTimestamp, r'WeatherItem', 'updateTimestamp'),
            timestamp: BuiltValueNullFieldError.checkNotNull(
                timestamp, r'WeatherItem', 'timestamp'),
            validPeriod: validPeriod.build(),
            forecasts: forecasts.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'validPeriod';
        validPeriod.build();
        _$failedField = 'forecasts';
        forecasts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WeatherItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
