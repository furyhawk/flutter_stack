// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ForecastItem extends ForecastItem {
  @override
  final String date;
  @override
  final DateTime updatedTimestamp;
  @override
  final DateTime timestamp;
  @override
  final GeneralForecast general;
  @override
  final BuiltList<BuiltMap<String, JsonObject?>>? periods;

  factory _$ForecastItem([void Function(ForecastItemBuilder)? updates]) =>
      (ForecastItemBuilder()..update(updates))._build();

  _$ForecastItem._(
      {required this.date,
      required this.updatedTimestamp,
      required this.timestamp,
      required this.general,
      this.periods})
      : super._();
  @override
  ForecastItem rebuild(void Function(ForecastItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForecastItemBuilder toBuilder() => ForecastItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForecastItem &&
        date == other.date &&
        updatedTimestamp == other.updatedTimestamp &&
        timestamp == other.timestamp &&
        general == other.general &&
        periods == other.periods;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, updatedTimestamp.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, general.hashCode);
    _$hash = $jc(_$hash, periods.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForecastItem')
          ..add('date', date)
          ..add('updatedTimestamp', updatedTimestamp)
          ..add('timestamp', timestamp)
          ..add('general', general)
          ..add('periods', periods))
        .toString();
  }
}

class ForecastItemBuilder
    implements Builder<ForecastItem, ForecastItemBuilder> {
  _$ForecastItem? _$v;

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

  GeneralForecastBuilder? _general;
  GeneralForecastBuilder get general =>
      _$this._general ??= GeneralForecastBuilder();
  set general(GeneralForecastBuilder? general) => _$this._general = general;

  ListBuilder<BuiltMap<String, JsonObject?>>? _periods;
  ListBuilder<BuiltMap<String, JsonObject?>> get periods =>
      _$this._periods ??= ListBuilder<BuiltMap<String, JsonObject?>>();
  set periods(ListBuilder<BuiltMap<String, JsonObject?>>? periods) =>
      _$this._periods = periods;

  ForecastItemBuilder() {
    ForecastItem._defaults(this);
  }

  ForecastItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _updatedTimestamp = $v.updatedTimestamp;
      _timestamp = $v.timestamp;
      _general = $v.general.toBuilder();
      _periods = $v.periods?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForecastItem other) {
    _$v = other as _$ForecastItem;
  }

  @override
  void update(void Function(ForecastItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForecastItem build() => _build();

  _$ForecastItem _build() {
    _$ForecastItem _$result;
    try {
      _$result = _$v ??
          _$ForecastItem._(
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'ForecastItem', 'date'),
            updatedTimestamp: BuiltValueNullFieldError.checkNotNull(
                updatedTimestamp, r'ForecastItem', 'updatedTimestamp'),
            timestamp: BuiltValueNullFieldError.checkNotNull(
                timestamp, r'ForecastItem', 'timestamp'),
            general: general.build(),
            periods: _periods?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'general';
        general.build();
        _$failedField = 'periods';
        _periods?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ForecastItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
