//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'lightning_record.g.dart';

/// LightningRecord
///
/// Properties:
/// * [datetime] 
/// * [item] 
/// * [updatedTimestamp] 
@BuiltValue()
abstract class LightningRecord implements Built<LightningRecord, LightningRecordBuilder> {
  @BuiltValueField(wireName: r'datetime')
  String get datetime;

  @BuiltValueField(wireName: r'item')
  BuiltMap<String, JsonObject?> get item;

  @BuiltValueField(wireName: r'updated_timestamp')
  DateTime? get updatedTimestamp;

  LightningRecord._();

  factory LightningRecord([void updates(LightningRecordBuilder b)]) = _$LightningRecord;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LightningRecordBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LightningRecord> get serializer => _$LightningRecordSerializer();
}

class _$LightningRecordSerializer implements PrimitiveSerializer<LightningRecord> {
  @override
  final Iterable<Type> types = const [LightningRecord, _$LightningRecord];

  @override
  final String wireName = r'LightningRecord';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LightningRecord object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'datetime';
    yield serializers.serialize(
      object.datetime,
      specifiedType: const FullType(String),
    );
    yield r'item';
    yield serializers.serialize(
      object.item,
      specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
    );
    if (object.updatedTimestamp != null) {
      yield r'updated_timestamp';
      yield serializers.serialize(
        object.updatedTimestamp,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    LightningRecord object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LightningRecordBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'datetime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.datetime = valueDes;
          break;
        case r'item':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>;
          result.item.replace(valueDes);
          break;
        case r'updated_timestamp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.updatedTimestamp = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LightningRecord deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LightningRecordBuilder();
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

