// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Station extends Station {
  @override
  final String id;
  @override
  final String? deviceId;
  @override
  final String name;
  @override
  final BuiltMap<String, num> location;

  factory _$Station([void Function(StationBuilder)? updates]) =>
      (StationBuilder()..update(updates))._build();

  _$Station._(
      {required this.id,
      this.deviceId,
      required this.name,
      required this.location})
      : super._();
  @override
  Station rebuild(void Function(StationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StationBuilder toBuilder() => StationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Station &&
        id == other.id &&
        deviceId == other.deviceId &&
        name == other.name &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Station')
          ..add('id', id)
          ..add('deviceId', deviceId)
          ..add('name', name)
          ..add('location', location))
        .toString();
  }
}

class StationBuilder implements Builder<Station, StationBuilder> {
  _$Station? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  MapBuilder<String, num>? _location;
  MapBuilder<String, num> get location =>
      _$this._location ??= MapBuilder<String, num>();
  set location(MapBuilder<String, num>? location) =>
      _$this._location = location;

  StationBuilder() {
    Station._defaults(this);
  }

  StationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _deviceId = $v.deviceId;
      _name = $v.name;
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Station other) {
    _$v = other as _$Station;
  }

  @override
  void update(void Function(StationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Station build() => _build();

  _$Station _build() {
    _$Station _$result;
    try {
      _$result = _$v ??
          _$Station._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Station', 'id'),
            deviceId: deviceId,
            name:
                BuiltValueNullFieldError.checkNotNull(name, r'Station', 'name'),
            location: location.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'Station', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
