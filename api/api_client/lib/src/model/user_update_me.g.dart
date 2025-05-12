// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_me.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserUpdateMe extends UserUpdateMe {
  @override
  final String? fullName;
  @override
  final String? email;

  factory _$UserUpdateMe([void Function(UserUpdateMeBuilder)? updates]) =>
      (new UserUpdateMeBuilder()..update(updates))._build();

  _$UserUpdateMe._({this.fullName, this.email}) : super._();

  @override
  UserUpdateMe rebuild(void Function(UserUpdateMeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserUpdateMeBuilder toBuilder() => new UserUpdateMeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserUpdateMe &&
        fullName == other.fullName &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserUpdateMe')
          ..add('fullName', fullName)
          ..add('email', email))
        .toString();
  }
}

class UserUpdateMeBuilder
    implements Builder<UserUpdateMe, UserUpdateMeBuilder> {
  _$UserUpdateMe? _$v;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  UserUpdateMeBuilder() {
    UserUpdateMe._defaults(this);
  }

  UserUpdateMeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserUpdateMe other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserUpdateMe;
  }

  @override
  void update(void Function(UserUpdateMeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserUpdateMe build() => _build();

  _$UserUpdateMe _build() {
    final _$result = _$v ??
        new _$UserUpdateMe._(
          fullName: fullName,
          email: email,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
