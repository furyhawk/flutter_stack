// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_direction_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WindDirectionData extends WindDirectionData {
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

  factory _$WindDirectionData(
          [void Function(WindDirectionDataBuilder)? updates]) =>
      (WindDirectionDataBuilder()..update(updates))._build();

  _$WindDirectionData._(
      {required this.stations,
      required this.readings,
      required this.readingType,
      required this.readingUnit,
      this.paginationToken})
      : super._();
  @override
  WindDirectionData rebuild(void Function(WindDirectionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WindDirectionDataBuilder toBuilder() =>
      WindDirectionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WindDirectionData &&
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
    return (newBuiltValueToStringHelper(r'WindDirectionData')
          ..add('stations', stations)
          ..add('readings', readings)
          ..add('readingType', readingType)
          ..add('readingUnit', readingUnit)
          ..add('paginationToken', paginationToken))
        .toString();
  }
}

class WindDirectionDataBuilder
    implements Builder<WindDirectionData, WindDirectionDataBuilder> {
  _$WindDirectionData? _$v;

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

  WindDirectionDataBuilder() {
    WindDirectionData._defaults(this);
  }

  WindDirectionDataBuilder get _$this {
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
  void replace(WindDirectionData other) {
    _$v = other as _$WindDirectionData;
  }

  @override
  void update(void Function(WindDirectionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WindDirectionData build() => _build();

  _$WindDirectionData _build() {
    _$WindDirectionData _$result;
    try {
      _$result = _$v ??
          _$WindDirectionData._(
            stations: stations.build(),
            readings: readings.build(),
            readingType: BuiltValueNullFieldError.checkNotNull(
                readingType, r'WindDirectionData', 'readingType'),
            readingUnit: BuiltValueNullFieldError.checkNotNull(
                readingUnit, r'WindDirectionData', 'readingUnit'),
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
            r'WindDirectionData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
