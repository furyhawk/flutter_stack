// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_metadata.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AreaMetadata extends AreaMetadata {
  @override
  final String name;
  @override
  final LabelLocation labelLocation;

  factory _$AreaMetadata([void Function(AreaMetadataBuilder)? updates]) =>
      (AreaMetadataBuilder()..update(updates))._build();

  _$AreaMetadata._({required this.name, required this.labelLocation})
      : super._();
  @override
  AreaMetadata rebuild(void Function(AreaMetadataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AreaMetadataBuilder toBuilder() => AreaMetadataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AreaMetadata &&
        name == other.name &&
        labelLocation == other.labelLocation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, labelLocation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AreaMetadata')
          ..add('name', name)
          ..add('labelLocation', labelLocation))
        .toString();
  }
}

class AreaMetadataBuilder
    implements Builder<AreaMetadata, AreaMetadataBuilder> {
  _$AreaMetadata? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  LabelLocationBuilder? _labelLocation;
  LabelLocationBuilder get labelLocation =>
      _$this._labelLocation ??= LabelLocationBuilder();
  set labelLocation(LabelLocationBuilder? labelLocation) =>
      _$this._labelLocation = labelLocation;

  AreaMetadataBuilder() {
    AreaMetadata._defaults(this);
  }

  AreaMetadataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _labelLocation = $v.labelLocation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AreaMetadata other) {
    _$v = other as _$AreaMetadata;
  }

  @override
  void update(void Function(AreaMetadataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AreaMetadata build() => _build();

  _$AreaMetadata _build() {
    _$AreaMetadata _$result;
    try {
      _$result = _$v ??
          _$AreaMetadata._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'AreaMetadata', 'name'),
            labelLocation: labelLocation.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'labelLocation';
        labelLocation.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AreaMetadata', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
