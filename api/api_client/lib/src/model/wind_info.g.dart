// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WindInfo extends WindInfo {
  @override
  final BuiltMap<String, JsonObject?> speed;
  @override
  final String direction;

  factory _$WindInfo([void Function(WindInfoBuilder)? updates]) =>
      (WindInfoBuilder()..update(updates))._build();

  _$WindInfo._({required this.speed, required this.direction}) : super._();
  @override
  WindInfo rebuild(void Function(WindInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WindInfoBuilder toBuilder() => WindInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WindInfo &&
        speed == other.speed &&
        direction == other.direction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, speed.hashCode);
    _$hash = $jc(_$hash, direction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WindInfo')
          ..add('speed', speed)
          ..add('direction', direction))
        .toString();
  }
}

class WindInfoBuilder implements Builder<WindInfo, WindInfoBuilder> {
  _$WindInfo? _$v;

  MapBuilder<String, JsonObject?>? _speed;
  MapBuilder<String, JsonObject?> get speed =>
      _$this._speed ??= MapBuilder<String, JsonObject?>();
  set speed(MapBuilder<String, JsonObject?>? speed) => _$this._speed = speed;

  String? _direction;
  String? get direction => _$this._direction;
  set direction(String? direction) => _$this._direction = direction;

  WindInfoBuilder() {
    WindInfo._defaults(this);
  }

  WindInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _speed = $v.speed.toBuilder();
      _direction = $v.direction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WindInfo other) {
    _$v = other as _$WindInfo;
  }

  @override
  void update(void Function(WindInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WindInfo build() => _build();

  _$WindInfo _build() {
    _$WindInfo _$result;
    try {
      _$result = _$v ??
          _$WindInfo._(
            speed: speed.build(),
            direction: BuiltValueNullFieldError.checkNotNull(
                direction, r'WindInfo', 'direction'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'speed';
        speed.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WindInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
