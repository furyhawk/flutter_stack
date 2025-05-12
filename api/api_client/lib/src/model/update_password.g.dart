// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdatePassword extends UpdatePassword {
  @override
  final String currentPassword;
  @override
  final String newPassword;

  factory _$UpdatePassword([void Function(UpdatePasswordBuilder)? updates]) =>
      (new UpdatePasswordBuilder()..update(updates))._build();

  _$UpdatePassword._({required this.currentPassword, required this.newPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currentPassword, r'UpdatePassword', 'currentPassword');
    BuiltValueNullFieldError.checkNotNull(
        newPassword, r'UpdatePassword', 'newPassword');
  }

  @override
  UpdatePassword rebuild(void Function(UpdatePasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdatePasswordBuilder toBuilder() =>
      new UpdatePasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdatePassword &&
        currentPassword == other.currentPassword &&
        newPassword == other.newPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currentPassword.hashCode);
    _$hash = $jc(_$hash, newPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdatePassword')
          ..add('currentPassword', currentPassword)
          ..add('newPassword', newPassword))
        .toString();
  }
}

class UpdatePasswordBuilder
    implements Builder<UpdatePassword, UpdatePasswordBuilder> {
  _$UpdatePassword? _$v;

  String? _currentPassword;
  String? get currentPassword => _$this._currentPassword;
  set currentPassword(String? currentPassword) =>
      _$this._currentPassword = currentPassword;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  UpdatePasswordBuilder() {
    UpdatePassword._defaults(this);
  }

  UpdatePasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentPassword = $v.currentPassword;
      _newPassword = $v.newPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdatePassword other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdatePassword;
  }

  @override
  void update(void Function(UpdatePasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdatePassword build() => _build();

  _$UpdatePassword _build() {
    final _$result = _$v ??
        new _$UpdatePassword._(
          currentPassword: BuiltValueNullFieldError.checkNotNull(
              currentPassword, r'UpdatePassword', 'currentPassword'),
          newPassword: BuiltValueNullFieldError.checkNotNull(
              newPassword, r'UpdatePassword', 'newPassword'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
