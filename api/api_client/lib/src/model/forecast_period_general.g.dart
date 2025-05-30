// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_period_general.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ForecastPeriodGeneral extends ForecastPeriodGeneral {
  @override
  final DateTime start;
  @override
  final DateTime end;
  @override
  final String text;

  factory _$ForecastPeriodGeneral(
          [void Function(ForecastPeriodGeneralBuilder)? updates]) =>
      (ForecastPeriodGeneralBuilder()..update(updates))._build();

  _$ForecastPeriodGeneral._(
      {required this.start, required this.end, required this.text})
      : super._();
  @override
  ForecastPeriodGeneral rebuild(
          void Function(ForecastPeriodGeneralBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForecastPeriodGeneralBuilder toBuilder() =>
      ForecastPeriodGeneralBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForecastPeriodGeneral &&
        start == other.start &&
        end == other.end &&
        text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, start.hashCode);
    _$hash = $jc(_$hash, end.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForecastPeriodGeneral')
          ..add('start', start)
          ..add('end', end)
          ..add('text', text))
        .toString();
  }
}

class ForecastPeriodGeneralBuilder
    implements Builder<ForecastPeriodGeneral, ForecastPeriodGeneralBuilder> {
  _$ForecastPeriodGeneral? _$v;

  DateTime? _start;
  DateTime? get start => _$this._start;
  set start(DateTime? start) => _$this._start = start;

  DateTime? _end;
  DateTime? get end => _$this._end;
  set end(DateTime? end) => _$this._end = end;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ForecastPeriodGeneralBuilder() {
    ForecastPeriodGeneral._defaults(this);
  }

  ForecastPeriodGeneralBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _start = $v.start;
      _end = $v.end;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForecastPeriodGeneral other) {
    _$v = other as _$ForecastPeriodGeneral;
  }

  @override
  void update(void Function(ForecastPeriodGeneralBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForecastPeriodGeneral build() => _build();

  _$ForecastPeriodGeneral _build() {
    final _$result = _$v ??
        _$ForecastPeriodGeneral._(
          start: BuiltValueNullFieldError.checkNotNull(
              start, r'ForecastPeriodGeneral', 'start'),
          end: BuiltValueNullFieldError.checkNotNull(
              end, r'ForecastPeriodGeneral', 'end'),
          text: BuiltValueNullFieldError.checkNotNull(
              text, r'ForecastPeriodGeneral', 'text'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
