// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_period.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ForecastPeriod extends ForecastPeriod {
  @override
  final DateTime start;
  @override
  final DateTime end;
  @override
  final String text;

  factory _$ForecastPeriod([void Function(ForecastPeriodBuilder)? updates]) =>
      (new ForecastPeriodBuilder()..update(updates))._build();

  _$ForecastPeriod._(
      {required this.start, required this.end, required this.text})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(start, r'ForecastPeriod', 'start');
    BuiltValueNullFieldError.checkNotNull(end, r'ForecastPeriod', 'end');
    BuiltValueNullFieldError.checkNotNull(text, r'ForecastPeriod', 'text');
  }

  @override
  ForecastPeriod rebuild(void Function(ForecastPeriodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForecastPeriodBuilder toBuilder() =>
      new ForecastPeriodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForecastPeriod &&
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
    return (newBuiltValueToStringHelper(r'ForecastPeriod')
          ..add('start', start)
          ..add('end', end)
          ..add('text', text))
        .toString();
  }
}

class ForecastPeriodBuilder
    implements Builder<ForecastPeriod, ForecastPeriodBuilder> {
  _$ForecastPeriod? _$v;

  DateTime? _start;
  DateTime? get start => _$this._start;
  set start(DateTime? start) => _$this._start = start;

  DateTime? _end;
  DateTime? get end => _$this._end;
  set end(DateTime? end) => _$this._end = end;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ForecastPeriodBuilder() {
    ForecastPeriod._defaults(this);
  }

  ForecastPeriodBuilder get _$this {
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
  void replace(ForecastPeriod other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ForecastPeriod;
  }

  @override
  void update(void Function(ForecastPeriodBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForecastPeriod build() => _build();

  _$ForecastPeriod _build() {
    final _$result = _$v ??
        new _$ForecastPeriod._(
          start: BuiltValueNullFieldError.checkNotNull(
              start, r'ForecastPeriod', 'start'),
          end: BuiltValueNullFieldError.checkNotNull(
              end, r'ForecastPeriod', 'end'),
          text: BuiltValueNullFieldError.checkNotNull(
              text, r'ForecastPeriod', 'text'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
