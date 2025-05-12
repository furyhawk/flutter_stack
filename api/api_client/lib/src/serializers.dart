//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:api_client/src/date_serializer.dart';
import 'package:api_client/src/model/date.dart';

import 'package:api_client/src/model/http_validation_error.dart';
import 'package:api_client/src/model/item_create.dart';
import 'package:api_client/src/model/item_public.dart';
import 'package:api_client/src/model/item_update.dart';
import 'package:api_client/src/model/items_public.dart';
import 'package:api_client/src/model/message.dart';
import 'package:api_client/src/model/new_password.dart';
import 'package:api_client/src/model/private_user_create.dart';
import 'package:api_client/src/model/token.dart';
import 'package:api_client/src/model/update_password.dart';
import 'package:api_client/src/model/user_create.dart';
import 'package:api_client/src/model/user_public.dart';
import 'package:api_client/src/model/user_register.dart';
import 'package:api_client/src/model/user_update.dart';
import 'package:api_client/src/model/user_update_me.dart';
import 'package:api_client/src/model/users_public.dart';
import 'package:api_client/src/model/validation_error.dart';
import 'package:api_client/src/model/validation_error_loc_inner.dart';

part 'serializers.g.dart';

@SerializersFor([
  HTTPValidationError,
  ItemCreate,
  ItemPublic,
  ItemUpdate,
  ItemsPublic,
  Message,
  NewPassword,
  PrivateUserCreate,
  Token,
  UpdatePassword,
  UserCreate,
  UserPublic,
  UserRegister,
  UserUpdate,
  UserUpdateMe,
  UsersPublic,
  ValidationError,
  ValidationErrorLocInner,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer())
    ).build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
