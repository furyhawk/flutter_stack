// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_user_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PrivateUserCreate extends PrivateUserCreate {
  @override
  final String email;
  @override
  final String password;
  @override
  final String fullName;
  @override
  final bool? isVerified;

  factory _$PrivateUserCreate(
          [void Function(PrivateUserCreateBuilder)? updates]) =>
      (new PrivateUserCreateBuilder()..update(updates))._build();

  _$PrivateUserCreate._(
      {required this.email,
      required this.password,
      required this.fullName,
      this.isVerified})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'PrivateUserCreate', 'email');
    BuiltValueNullFieldError.checkNotNull(
        password, r'PrivateUserCreate', 'password');
    BuiltValueNullFieldError.checkNotNull(
        fullName, r'PrivateUserCreate', 'fullName');
  }

  @override
  PrivateUserCreate rebuild(void Function(PrivateUserCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrivateUserCreateBuilder toBuilder() =>
      new PrivateUserCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PrivateUserCreate &&
        email == other.email &&
        password == other.password &&
        fullName == other.fullName &&
        isVerified == other.isVerified;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, isVerified.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PrivateUserCreate')
          ..add('email', email)
          ..add('password', password)
          ..add('fullName', fullName)
          ..add('isVerified', isVerified))
        .toString();
  }
}

class PrivateUserCreateBuilder
    implements Builder<PrivateUserCreate, PrivateUserCreateBuilder> {
  _$PrivateUserCreate? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  bool? _isVerified;
  bool? get isVerified => _$this._isVerified;
  set isVerified(bool? isVerified) => _$this._isVerified = isVerified;

  PrivateUserCreateBuilder() {
    PrivateUserCreate._defaults(this);
  }

  PrivateUserCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _fullName = $v.fullName;
      _isVerified = $v.isVerified;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PrivateUserCreate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PrivateUserCreate;
  }

  @override
  void update(void Function(PrivateUserCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PrivateUserCreate build() => _build();

  _$PrivateUserCreate _build() {
    final _$result = _$v ??
        new _$PrivateUserCreate._(
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'PrivateUserCreate', 'email'),
          password: BuiltValueNullFieldError.checkNotNull(
              password, r'PrivateUserCreate', 'password'),
          fullName: BuiltValueNullFieldError.checkNotNull(
              fullName, r'PrivateUserCreate', 'fullName'),
          isVerified: isVerified,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
