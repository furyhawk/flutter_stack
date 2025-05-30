//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/reading_data_point.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reading.g.dart';

/// Reading
///
/// Properties:
/// * [timestamp] 
/// * [data] 
@BuiltValue()
abstract class Reading implements Built<Reading, ReadingBuilder> {
  @BuiltValueField(wireName: r'timestamp')
  DateTime get timestamp;

  @BuiltValueField(wireName: r'data')
  BuiltList<ReadingDataPoint> get data;

  Reading._();

  factory Reading([void updates(ReadingBuilder b)]) = _$Reading;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReadingBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Reading> get serializer => _$ReadingSerializer();
}

class _$ReadingSerializer implements PrimitiveSerializer<Reading> {
  @override
  final Iterable<Type> types = const [Reading, _$Reading];

  @override
  final String wireName = r'Reading';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Reading object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'timestamp';
    yield serializers.serialize(
      object.timestamp,
      specifiedType: const FullType(DateTime),
    );
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BuiltList, [FullType(ReadingDataPoint)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Reading object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReadingBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'timestamp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.timestamp = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ReadingDataPoint)]),
          ) as BuiltList<ReadingDataPoint>;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Reading deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReadingBuilder();
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

