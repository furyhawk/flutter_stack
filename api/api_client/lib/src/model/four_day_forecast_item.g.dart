// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'four_day_forecast_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FourDayForecastItem extends FourDayForecastItem {
  @override
  final String date;
  @override
  final DateTime updatedTimestamp;
  @override
  final DateTime timestamp;
  @override
  final BuiltList<BuiltMap<String, JsonObject?>> forecasts;

  factory _$FourDayForecastItem(
          [void Function(FourDayForecastItemBuilder)? updates]) =>
      (FourDayForecastItemBuilder()..update(updates))._build();

  _$FourDayForecastItem._(
      {required this.date,
      required this.updatedTimestamp,
      required this.timestamp,
      required this.forecasts})
      : super._();
  @override
  FourDayForecastItem rebuild(
          void Function(FourDayForecastItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FourDayForecastItemBuilder toBuilder() =>
      FourDayForecastItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FourDayForecastItem &&
        date == other.date &&
        updatedTimestamp == other.updatedTimestamp &&
        timestamp == other.timestamp &&
        forecasts == other.forecasts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, updatedTimestamp.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, forecasts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FourDayForecastItem')
          ..add('date', date)
          ..add('updatedTimestamp', updatedTimestamp)
          ..add('timestamp', timestamp)
          ..add('forecasts', forecasts))
        .toString();
  }
}

class FourDayForecastItemBuilder
    implements Builder<FourDayForecastItem, FourDayForecastItemBuilder> {
  _$FourDayForecastItem? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  DateTime? _updatedTimestamp;
  DateTime? get updatedTimestamp => _$this._updatedTimestamp;
  set updatedTimestamp(DateTime? updatedTimestamp) =>
      _$this._updatedTimestamp = updatedTimestamp;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  ListBuilder<BuiltMap<String, JsonObject?>>? _forecasts;
  ListBuilder<BuiltMap<String, JsonObject?>> get forecasts =>
      _$this._forecasts ??= ListBuilder<BuiltMap<String, JsonObject?>>();
  set forecasts(ListBuilder<BuiltMap<String, JsonObject?>>? forecasts) =>
      _$this._forecasts = forecasts;

  FourDayForecastItemBuilder() {
    FourDayForecastItem._defaults(this);
  }

  FourDayForecastItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _updatedTimestamp = $v.updatedTimestamp;
      _timestamp = $v.timestamp;
      _forecasts = $v.forecasts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FourDayForecastItem other) {
    _$v = other as _$FourDayForecastItem;
  }

  @override
  void update(void Function(FourDayForecastItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FourDayForecastItem build() => _build();

  _$FourDayForecastItem _build() {
    _$FourDayForecastItem _$result;
    try {
      _$result = _$v ??
          _$FourDayForecastItem._(
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'FourDayForecastItem', 'date'),
            updatedTimestamp: BuiltValueNullFieldError.checkNotNull(
                updatedTimestamp, r'FourDayForecastItem', 'updatedTimestamp'),
            timestamp: BuiltValueNullFieldError.checkNotNull(
                timestamp, r'FourDayForecastItem', 'timestamp'),
            forecasts: forecasts.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'forecasts';
        forecasts.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FourDayForecastItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
