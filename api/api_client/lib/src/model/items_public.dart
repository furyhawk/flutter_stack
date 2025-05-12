//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/item_public.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'items_public.g.dart';

/// ItemsPublic
///
/// Properties:
/// * [data] 
/// * [count] 
@BuiltValue()
abstract class ItemsPublic implements Built<ItemsPublic, ItemsPublicBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<ItemPublic> get data;

  @BuiltValueField(wireName: r'count')
  int get count;

  ItemsPublic._();

  factory ItemsPublic([void updates(ItemsPublicBuilder b)]) = _$ItemsPublic;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ItemsPublicBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ItemsPublic> get serializer => _$ItemsPublicSerializer();
}

class _$ItemsPublicSerializer implements PrimitiveSerializer<ItemsPublic> {
  @override
  final Iterable<Type> types = const [ItemsPublic, _$ItemsPublic];

  @override
  final String wireName = r'ItemsPublic';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ItemsPublic object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BuiltList, [FullType(ItemPublic)]),
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
    ItemsPublic object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ItemsPublicBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ItemPublic)]),
          ) as BuiltList<ItemPublic>;
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
  ItemsPublic deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ItemsPublicBuilder();
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

