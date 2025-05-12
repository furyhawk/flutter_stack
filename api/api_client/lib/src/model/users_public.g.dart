// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UsersPublic extends UsersPublic {
  @override
  final BuiltList<UserPublic> data;
  @override
  final int count;

  factory _$UsersPublic([void Function(UsersPublicBuilder)? updates]) =>
      (new UsersPublicBuilder()..update(updates))._build();

  _$UsersPublic._({required this.data, required this.count}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'UsersPublic', 'data');
    BuiltValueNullFieldError.checkNotNull(count, r'UsersPublic', 'count');
  }

  @override
  UsersPublic rebuild(void Function(UsersPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersPublicBuilder toBuilder() => new UsersPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersPublic && data == other.data && count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersPublic')
          ..add('data', data)
          ..add('count', count))
        .toString();
  }
}

class UsersPublicBuilder implements Builder<UsersPublic, UsersPublicBuilder> {
  _$UsersPublic? _$v;

  ListBuilder<UserPublic>? _data;
  ListBuilder<UserPublic> get data =>
      _$this._data ??= new ListBuilder<UserPublic>();
  set data(ListBuilder<UserPublic>? data) => _$this._data = data;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  UsersPublicBuilder() {
    UsersPublic._defaults(this);
  }

  UsersPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersPublic other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersPublic;
  }

  @override
  void update(void Function(UsersPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersPublic build() => _build();

  _$UsersPublic _build() {
    _$UsersPublic _$result;
    try {
      _$result = _$v ??
          new _$UsersPublic._(
            data: data.build(),
            count: BuiltValueNullFieldError.checkNotNull(
                count, r'UsersPublic', 'count'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersPublic', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
