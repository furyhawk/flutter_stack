// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WeatherData extends WeatherData {
  @override
  final BuiltList<AreaMetadata> areaMetadata;
  @override
  final BuiltList<WeatherItem> items;
  @override
  final String? paginationToken;

  factory _$WeatherData([void Function(WeatherDataBuilder)? updates]) =>
      (new WeatherDataBuilder()..update(updates))._build();

  _$WeatherData._(
      {required this.areaMetadata, required this.items, this.paginationToken})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        areaMetadata, r'WeatherData', 'areaMetadata');
    BuiltValueNullFieldError.checkNotNull(items, r'WeatherData', 'items');
  }

  @override
  WeatherData rebuild(void Function(WeatherDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherDataBuilder toBuilder() => new WeatherDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherData &&
        areaMetadata == other.areaMetadata &&
        items == other.items &&
        paginationToken == other.paginationToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, areaMetadata.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, paginationToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherData')
          ..add('areaMetadata', areaMetadata)
          ..add('items', items)
          ..add('paginationToken', paginationToken))
        .toString();
  }
}

class WeatherDataBuilder implements Builder<WeatherData, WeatherDataBuilder> {
  _$WeatherData? _$v;

  ListBuilder<AreaMetadata>? _areaMetadata;
  ListBuilder<AreaMetadata> get areaMetadata =>
      _$this._areaMetadata ??= new ListBuilder<AreaMetadata>();
  set areaMetadata(ListBuilder<AreaMetadata>? areaMetadata) =>
      _$this._areaMetadata = areaMetadata;

  ListBuilder<WeatherItem>? _items;
  ListBuilder<WeatherItem> get items =>
      _$this._items ??= new ListBuilder<WeatherItem>();
  set items(ListBuilder<WeatherItem>? items) => _$this._items = items;

  String? _paginationToken;
  String? get paginationToken => _$this._paginationToken;
  set paginationToken(String? paginationToken) =>
      _$this._paginationToken = paginationToken;

  WeatherDataBuilder() {
    WeatherData._defaults(this);
  }

  WeatherDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _areaMetadata = $v.areaMetadata.toBuilder();
      _items = $v.items.toBuilder();
      _paginationToken = $v.paginationToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherData;
  }

  @override
  void update(void Function(WeatherDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherData build() => _build();

  _$WeatherData _build() {
    _$WeatherData _$result;
    try {
      _$result = _$v ??
          new _$WeatherData._(
            areaMetadata: areaMetadata.build(),
            items: items.build(),
            paginationToken: paginationToken,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'areaMetadata';
        areaMetadata.build();
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WeatherData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
