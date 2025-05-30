// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label_location.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LabelLocation extends LabelLocation {
  @override
  final num latitude;
  @override
  final num longitude;

  factory _$LabelLocation([void Function(LabelLocationBuilder)? updates]) =>
      (LabelLocationBuilder()..update(updates))._build();

  _$LabelLocation._({required this.latitude, required this.longitude})
      : super._();
  @override
  LabelLocation rebuild(void Function(LabelLocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LabelLocationBuilder toBuilder() => LabelLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LabelLocation &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LabelLocation')
          ..add('latitude', latitude)
          ..add('longitude', longitude))
        .toString();
  }
}

class LabelLocationBuilder
    implements Builder<LabelLocation, LabelLocationBuilder> {
  _$LabelLocation? _$v;

  num? _latitude;
  num? get latitude => _$this._latitude;
  set latitude(num? latitude) => _$this._latitude = latitude;

  num? _longitude;
  num? get longitude => _$this._longitude;
  set longitude(num? longitude) => _$this._longitude = longitude;

  LabelLocationBuilder() {
    LabelLocation._defaults(this);
  }

  LabelLocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LabelLocation other) {
    _$v = other as _$LabelLocation;
  }

  @override
  void update(void Function(LabelLocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LabelLocation build() => _build();

  _$LabelLocation _build() {
    final _$result = _$v ??
        _$LabelLocation._(
          latitude: BuiltValueNullFieldError.checkNotNull(
              latitude, r'LabelLocation', 'latitude'),
          longitude: BuiltValueNullFieldError.checkNotNull(
              longitude, r'LabelLocation', 'longitude'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
