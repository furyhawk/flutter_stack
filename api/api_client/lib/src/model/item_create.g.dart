// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ItemCreate extends ItemCreate {
  @override
  final String title;
  @override
  final String? description;

  factory _$ItemCreate([void Function(ItemCreateBuilder)? updates]) =>
      (new ItemCreateBuilder()..update(updates))._build();

  _$ItemCreate._({required this.title, this.description}) : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'ItemCreate', 'title');
  }

  @override
  ItemCreate rebuild(void Function(ItemCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemCreateBuilder toBuilder() => new ItemCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemCreate &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ItemCreate')
          ..add('title', title)
          ..add('description', description))
        .toString();
  }
}

class ItemCreateBuilder implements Builder<ItemCreate, ItemCreateBuilder> {
  _$ItemCreate? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ItemCreateBuilder() {
    ItemCreate._defaults(this);
  }

  ItemCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemCreate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ItemCreate;
  }

  @override
  void update(void Function(ItemCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ItemCreate build() => _build();

  _$ItemCreate _build() {
    final _$result = _$v ??
        new _$ItemCreate._(
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'ItemCreate', 'title'),
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
