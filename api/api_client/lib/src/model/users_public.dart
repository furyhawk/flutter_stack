//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/user_public.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'users_public.g.dart';

/// UsersPublic
///
/// Properties:
/// * [data] 
/// * [count] 
@BuiltValue()
abstract class UsersPublic implements Built<UsersPublic, UsersPublicBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<UserPublic> get data;

  @BuiltValueField(wireName: r'count')
  int get count;

  UsersPublic._();

  factory UsersPublic([void updates(UsersPublicBuilder b)]) = _$UsersPublic;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UsersPublicBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersPublic> get serializer => _$UsersPublicSerializer();
}

class _$UsersPublicSerializer implements PrimitiveSerializer<UsersPublic> {
  @override
  final Iterable<Type> types = const [UsersPublic, _$UsersPublic];

  @override
  final String wireName = r'UsersPublic';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UsersPublic object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BuiltList, [FullType(UserPublic)]),
    );
    yield r'count';
    yield serializers.serialize(
      object.count,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UsersPublic object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UsersPublicBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UserPublic)]),
          ) as BuiltList<UserPublic>;
          result.data.replace(valueDes);
          break;
        case r'count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.count = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UsersPublic deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersPublicBuilder();
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

