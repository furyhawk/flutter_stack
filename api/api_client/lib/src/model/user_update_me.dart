//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_update_me.g.dart';

/// UserUpdateMe
///
/// Properties:
/// * [fullName] 
/// * [email] 
@BuiltValue()
abstract class UserUpdateMe implements Built<UserUpdateMe, UserUpdateMeBuilder> {
  @BuiltValueField(wireName: r'full_name')
  String? get fullName;

  @BuiltValueField(wireName: r'email')
  String? get email;

  UserUpdateMe._();

  factory UserUpdateMe([void updates(UserUpdateMeBuilder b)]) = _$UserUpdateMe;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserUpdateMeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserUpdateMe> get serializer => _$UserUpdateMeSerializer();
}

class _$UserUpdateMeSerializer implements PrimitiveSerializer<UserUpdateMe> {
  @override
  final Iterable<Type> types = const [UserUpdateMe, _$UserUpdateMe];

  @override
  final String wireName = r'UserUpdateMe';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserUpdateMe object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.fullName != null) {
      yield r'full_name';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserUpdateMe object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserUpdateMeBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fullName = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserUpdateMe deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserUpdateMeBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

