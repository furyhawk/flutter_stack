// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_temperature_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AirTemperatureData extends AirTemperatureData {
  @override
  final BuiltList<Station> stations;
  @override
  final BuiltList<Reading> readings;
  @override
  final String readingType;
  @override
  final String readingUnit;
  @override
  final String? paginationToken;

  factory _$AirTemperatureData(
          [void Function(AirTemperatureDataBuilder)? updates]) =>
      (AirTemperatureDataBuilder()..update(updates))._build();

  _$AirTemperatureData._(
      {required this.stations,
      required this.readings,
      required this.readingType,
      required this.readingUnit,
      this.paginationToken})
      : super._();
  @override
  AirTemperatureData rebuild(
          void Function(AirTemperatureDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AirTemperatureDataBuilder toBuilder() =>
      AirTemperatureDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AirTemperatureData &&
        stations == other.stations &&
        readings == other.readings &&
        readingType == other.readingType &&
        readingUnit == other.readingUnit &&
        paginationToken == other.paginationToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, stations.hashCode);
    _$hash = $jc(_$hash, readings.hashCode);
    _$hash = $jc(_$hash, readingType.hashCode);
    _$hash = $jc(_$hash, readingUnit.hashCode);
    _$hash = $jc(_$hash, paginationToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AirTemperatureData')
          ..add('stations', stations)
          ..add('readings', readings)
          ..add('readingType', readingType)
          ..add('readingUnit', readingUnit)
          ..add('paginationToken', paginationToken))
        .toString();
  }
}

class AirTemperatureDataBuilder
    implements Builder<AirTemperatureData, AirTemperatureDataBuilder> {
  _$AirTemperatureData? _$v;

  ListBuilder<Station>? _stations;
  ListBuilder<Station> get stations =>
      _$this._stations ??= ListBuilder<Station>();
  set stations(ListBuilder<Station>? stations) => _$this._stations = stations;

  ListBuilder<Reading>? _readings;
  ListBuilder<Reading> get readings =>
      _$this._readings ??= ListBuilder<Reading>();
  set readings(ListBuilder<Reading>? readings) => _$this._readings = readings;

  String? _readingType;
  String? get readingType => _$this._readingType;
  set readingType(String? readingType) => _$this._readingType = readingType;

  String? _readingUnit;
  String? get readingUnit => _$this._readingUnit;
  set readingUnit(String? readingUnit) => _$this._readingUnit = readingUnit;

  String? _paginationToken;
  String? get paginationToken => _$this._paginationToken;
  set paginationToken(String? paginationToken) =>
      _$this._paginationToken = paginationToken;

  AirTemperatureDataBuilder() {
    AirTemperatureData._defaults(this);
  }

  AirTemperatureDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stations = $v.stations.toBuilder();
      _readings = $v.readings.toBuilder();
      _readingType = $v.readingType;
      _readingUnit = $v.readingUnit;
      _paginationToken = $v.paginationToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AirTemperatureData other) {
    _$v = other as _$AirTemperatureData;
  }

  @override
  void update(void Function(AirTemperatureDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AirTemperatureData build() => _build();

  _$AirTemperatureData _build() {
    _$AirTemperatureData _$result;
    try {
      _$result = _$v ??
          _$AirTemperatureData._(
            stations: stations.build(),
            readings: readings.build(),
            readingType: BuiltValueNullFieldError.checkNotNull(
                readingType, r'AirTemperatureData', 'readingType'),
            readingUnit: BuiltValueNullFieldError.checkNotNull(
                readingUnit, r'AirTemperatureData', 'readingUnit'),
            paginationToken: paginationToken,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stations';
        stations.build();
        _$failedField = 'readings';
        readings.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AirTemperatureData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
