//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wbgt_record.g.dart';

/// WBGTRecord
///
/// Properties:
/// * [datetime] 
/// * [item] 
/// * [updatedTimestamp] 
@BuiltValue()
abstract class WBGTRecord implements Built<WBGTRecord, WBGTRecordBuilder> {
  @BuiltValueField(wireName: r'datetime')
  String get datetime;

  @BuiltValueField(wireName: r'item')
  BuiltMap<String, JsonObject?> get item;

  @BuiltValueField(wireName: r'updated_timestamp')
  DateTime? get updatedTimestamp;

  WBGTRecord._();

  factory WBGTRecord([void updates(WBGTRecordBuilder b)]) = _$WBGTRecord;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WBGTRecordBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WBGTRecord> get serializer => _$WBGTRecordSerializer();
}

class _$WBGTRecordSerializer implements PrimitiveSerializer<WBGTRecord> {
  @override
  final Iterable<Type> types = const [WBGTRecord, _$WBGTRecord];

  @override
  final String wireName = r'WBGTRecord';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WBGTRecord object, {
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
    WBGTRecord object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WBGTRecordBuilder result,
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
  WBGTRecord deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WBGTRecordBuilder();
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

