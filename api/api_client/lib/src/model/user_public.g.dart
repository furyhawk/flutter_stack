// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserPublic extends UserPublic {
  @override
  final String email;
  @override
  final bool? isActive;
  @override
  final bool? isSuperuser;
  @override
  final String? fullName;
  @override
  final String id;

  factory _$UserPublic([void Function(UserPublicBuilder)? updates]) =>
      (UserPublicBuilder()..update(updates))._build();

  _$UserPublic._(
      {required this.email,
      this.isActive,
      this.isSuperuser,
      this.fullName,
      required this.id})
      : super._();
  @override
  UserPublic rebuild(void Function(UserPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPublicBuilder toBuilder() => UserPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPublic &&
        email == other.email &&
        isActive == other.isActive &&
        isSuperuser == other.isSuperuser &&
        fullName == other.fullName &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, isSuperuser.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserPublic')
          ..add('email', email)
          ..add('isActive', isActive)
          ..add('isSuperuser', isSuperuser)
          ..add('fullName', fullName)
          ..add('id', id))
        .toString();
  }
}

class UserPublicBuilder implements Builder<UserPublic, UserPublicBuilder> {
  _$UserPublic? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  bool? _isSuperuser;
  bool? get isSuperuser => _$this._isSuperuser;
  set isSuperuser(bool? isSuperuser) => _$this._isSuperuser = isSuperuser;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  UserPublicBuilder() {
    UserPublic._defaults(this);
  }

  UserPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _isActive = $v.isActive;
      _isSuperuser = $v.isSuperuser;
      _fullName = $v.fullName;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserPublic other) {
    _$v = other as _$UserPublic;
  }

  @override
  void update(void Function(UserPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserPublic build() => _build();

  _$UserPublic _build() {
    final _$result = _$v ??
        _$UserPublic._(
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'UserPublic', 'email'),
          isActive: isActive,
          isSuperuser: isSuperuser,
          fullName: fullName,
          id: BuiltValueNullFieldError.checkNotNull(id, r'UserPublic', 'id'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
