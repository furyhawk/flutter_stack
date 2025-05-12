// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ItemUpdate extends ItemUpdate {
  @override
  final String? title;
  @override
  final String? description;

  factory _$ItemUpdate([void Function(ItemUpdateBuilder)? updates]) =>
      (new ItemUpdateBuilder()..update(updates))._build();

  _$ItemUpdate._({this.title, this.description}) : super._();

  @override
  ItemUpdate rebuild(void Function(ItemUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemUpdateBuilder toBuilder() => new ItemUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemUpdate &&
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
    return (newBuiltValueToStringHelper(r'ItemUpdate')
          ..add('title', title)
          ..add('description', description))
        .toString();
  }
}

class ItemUpdateBuilder implements Builder<ItemUpdate, ItemUpdateBuilder> {
  _$ItemUpdate? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ItemUpdateBuilder() {
    ItemUpdate._defaults(this);
  }

  ItemUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemUpdate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ItemUpdate;
  }

  @override
  void update(void Function(ItemUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ItemUpdate build() => _build();

  _$ItemUpdate _build() {
    final _$result = _$v ??
        new _$ItemUpdate._(
          title: title,
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
