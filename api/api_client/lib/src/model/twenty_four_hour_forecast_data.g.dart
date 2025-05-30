// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twenty_four_hour_forecast_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TwentyFourHourForecastData extends TwentyFourHourForecastData {
  @override
  final BuiltList<AreaMetadata>? areaMetadata;
  @override
  final BuiltList<ForecastItem> records;
  @override
  final String? paginationToken;

  factory _$TwentyFourHourForecastData(
          [void Function(TwentyFourHourForecastDataBuilder)? updates]) =>
      (TwentyFourHourForecastDataBuilder()..update(updates))._build();

  _$TwentyFourHourForecastData._(
      {this.areaMetadata, required this.records, this.paginationToken})
      : super._();
  @override
  TwentyFourHourForecastData rebuild(
          void Function(TwentyFourHourForecastDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TwentyFourHourForecastDataBuilder toBuilder() =>
      TwentyFourHourForecastDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TwentyFourHourForecastData &&
        areaMetadata == other.areaMetadata &&
        records == other.records &&
        paginationToken == other.paginationToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, areaMetadata.hashCode);
    _$hash = $jc(_$hash, records.hashCode);
    _$hash = $jc(_$hash, paginationToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TwentyFourHourForecastData')
          ..add('areaMetadata', areaMetadata)
          ..add('records', records)
          ..add('paginationToken', paginationToken))
        .toString();
  }
}

class TwentyFourHourForecastDataBuilder
    implements
        Builder<TwentyFourHourForecastData, TwentyFourHourForecastDataBuilder> {
  _$TwentyFourHourForecastData? _$v;

  ListBuilder<AreaMetadata>? _areaMetadata;
  ListBuilder<AreaMetadata> get areaMetadata =>
      _$this._areaMetadata ??= ListBuilder<AreaMetadata>();
  set areaMetadata(ListBuilder<AreaMetadata>? areaMetadata) =>
      _$this._areaMetadata = areaMetadata;

  ListBuilder<ForecastItem>? _records;
  ListBuilder<ForecastItem> get records =>
      _$this._records ??= ListBuilder<ForecastItem>();
  set records(ListBuilder<ForecastItem>? records) => _$this._records = records;

  String? _paginationToken;
  String? get paginationToken => _$this._paginationToken;
  set paginationToken(String? paginationToken) =>
      _$this._paginationToken = paginationToken;

  TwentyFourHourForecastDataBuilder() {
    TwentyFourHourForecastData._defaults(this);
  }

  TwentyFourHourForecastDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _areaMetadata = $v.areaMetadata?.toBuilder();
      _records = $v.records.toBuilder();
      _paginationToken = $v.paginationToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TwentyFourHourForecastData other) {
    _$v = other as _$TwentyFourHourForecastData;
  }

  @override
  void update(void Function(TwentyFourHourForecastDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TwentyFourHourForecastData build() => _build();

  _$TwentyFourHourForecastData _build() {
    _$TwentyFourHourForecastData _$result;
    try {
      _$result = _$v ??
          _$TwentyFourHourForecastData._(
            areaMetadata: _areaMetadata?.build(),
            records: records.build(),
            paginationToken: paginationToken,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'areaMetadata';
        _areaMetadata?.build();
        _$failedField = 'records';
        records.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TwentyFourHourForecastData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
