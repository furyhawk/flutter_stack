// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(HTTPValidationError.serializer)
      ..add(ItemCreate.serializer)
      ..add(ItemPublic.serializer)
      ..add(ItemUpdate.serializer)
      ..add(ItemsPublic.serializer)
      ..add(Message.serializer)
      ..add(NewPassword.serializer)
      ..add(PrivateUserCreate.serializer)
      ..add(Token.serializer)
      ..add(UpdatePassword.serializer)
      ..add(UserCreate.serializer)
      ..add(UserPublic.serializer)
      ..add(UserRegister.serializer)
      ..add(UserUpdate.serializer)
      ..add(UserUpdateMe.serializer)
      ..add(UsersPublic.serializer)
      ..add(ValidationError.serializer)
      ..add(ValidationErrorLocInner.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ItemPublic)]),
          () => new ListBuilder<ItemPublic>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserPublic)]),
          () => new ListBuilder<UserPublic>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ValidationError)]),
          () => new ListBuilder<ValidationError>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ValidationErrorLocInner)]),
          () => new ListBuilder<ValidationErrorLocInner>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
