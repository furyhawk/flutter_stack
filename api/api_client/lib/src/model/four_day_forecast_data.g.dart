// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'four_day_forecast_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FourDayForecastData extends FourDayForecastData {
  @override
  final BuiltList<FourDayForecastItem> records;
  @override
  final String? paginationToken;

  factory _$FourDayForecastData(
          [void Function(FourDayForecastDataBuilder)? updates]) =>
      (FourDayForecastDataBuilder()..update(updates))._build();

  _$FourDayForecastData._({required this.records, this.paginationToken})
      : super._();
  @override
  FourDayForecastData rebuild(
          void Function(FourDayForecastDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FourDayForecastDataBuilder toBuilder() =>
      FourDayForecastDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FourDayForecastData &&
        records == other.records &&
        paginationToken == other.paginationToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, records.hashCode);
    _$hash = $jc(_$hash, paginationToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FourDayForecastData')
          ..add('records', records)
          ..add('paginationToken', paginationToken))
        .toString();
  }
}

class FourDayForecastDataBuilder
    implements Builder<FourDayForecastData, FourDayForecastDataBuilder> {
  _$FourDayForecastData? _$v;

  ListBuilder<FourDayForecastItem>? _records;
  ListBuilder<FourDayForecastItem> get records =>
      _$this._records ??= ListBuilder<FourDayForecastItem>();
  set records(ListBuilder<FourDayForecastItem>? records) =>
      _$this._records = records;

  String? _paginationToken;
  String? get paginationToken => _$this._paginationToken;
  set paginationToken(String? paginationToken) =>
      _$this._paginationToken = paginationToken;

  FourDayForecastDataBuilder() {
    FourDayForecastData._defaults(this);
  }

  FourDayForecastDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _records = $v.records.toBuilder();
      _paginationToken = $v.paginationToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FourDayForecastData other) {
    _$v = other as _$FourDayForecastData;
  }

  @override
  void update(void Function(FourDayForecastDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FourDayForecastData build() => _build();

  _$FourDayForecastData _build() {
    _$FourDayForecastData _$result;
    try {
      _$result = _$v ??
          _$FourDayForecastData._(
            records: records.build(),
            paginationToken: paginationToken,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'records';
        records.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FourDayForecastData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
