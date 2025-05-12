// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_password.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewPassword extends NewPassword {
  @override
  final String token;
  @override
  final String newPassword;

  factory _$NewPassword([void Function(NewPasswordBuilder)? updates]) =>
      (new NewPasswordBuilder()..update(updates))._build();

  _$NewPassword._({required this.token, required this.newPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(token, r'NewPassword', 'token');
    BuiltValueNullFieldError.checkNotNull(
        newPassword, r'NewPassword', 'newPassword');
  }

  @override
  NewPassword rebuild(void Function(NewPasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewPasswordBuilder toBuilder() => new NewPasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewPassword &&
        token == other.token &&
        newPassword == other.newPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, newPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewPassword')
          ..add('token', token)
          ..add('newPassword', newPassword))
        .toString();
  }
}

class NewPasswordBuilder implements Builder<NewPassword, NewPasswordBuilder> {
  _$NewPassword? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  NewPasswordBuilder() {
    NewPassword._defaults(this);
  }

  NewPasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _newPassword = $v.newPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewPassword other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewPassword;
  }

  @override
  void update(void Function(NewPasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewPassword build() => _build();

  _$NewPassword _build() {
    final _$result = _$v ??
        new _$NewPassword._(
          token: BuiltValueNullFieldError.checkNotNull(
              token, r'NewPassword', 'token'),
          newPassword: BuiltValueNullFieldError.checkNotNull(
              newPassword, r'NewPassword', 'newPassword'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
