// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ItemsPublic extends ItemsPublic {
  @override
  final BuiltList<ItemPublic> data;
  @override
  final int count;

  factory _$ItemsPublic([void Function(ItemsPublicBuilder)? updates]) =>
      (new ItemsPublicBuilder()..update(updates))._build();

  _$ItemsPublic._({required this.data, required this.count}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'ItemsPublic', 'data');
    BuiltValueNullFieldError.checkNotNull(count, r'ItemsPublic', 'count');
  }

  @override
  ItemsPublic rebuild(void Function(ItemsPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemsPublicBuilder toBuilder() => new ItemsPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemsPublic && data == other.data && count == other.count;
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
    return (newBuiltValueToStringHelper(r'ItemsPublic')
          ..add('data', data)
          ..add('count', count))
        .toString();
  }
}

class ItemsPublicBuilder implements Builder<ItemsPublic, ItemsPublicBuilder> {
  _$ItemsPublic? _$v;

  ListBuilder<ItemPublic>? _data;
  ListBuilder<ItemPublic> get data =>
      _$this._data ??= new ListBuilder<ItemPublic>();
  set data(ListBuilder<ItemPublic>? data) => _$this._data = data;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  ItemsPublicBuilder() {
    ItemsPublic._defaults(this);
  }

  ItemsPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemsPublic other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ItemsPublic;
  }

  @override
  void update(void Function(ItemsPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ItemsPublic build() => _build();

  _$ItemsPublic _build() {
    _$ItemsPublic _$result;
    try {
      _$result = _$v ??
          new _$ItemsPublic._(
            data: data.build(),
            count: BuiltValueNullFieldError.checkNotNull(
                count, r'ItemsPublic', 'count'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ItemsPublic', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
