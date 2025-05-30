//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reading_data_point.g.dart';

/// ReadingDataPoint
///
/// Properties:
/// * [stationId] 
/// * [value] 
@BuiltValue()
abstract class ReadingDataPoint implements Built<ReadingDataPoint, ReadingDataPointBuilder> {
  @BuiltValueField(wireName: r'stationId')
  String get stationId;

  @BuiltValueField(wireName: r'value')
  num get value;

  ReadingDataPoint._();

  factory ReadingDataPoint([void updates(ReadingDataPointBuilder b)]) = _$ReadingDataPoint;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReadingDataPointBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReadingDataPoint> get serializer => _$ReadingDataPointSerializer();
}

class _$ReadingDataPointSerializer implements PrimitiveSerializer<ReadingDataPoint> {
  @override
  final Iterable<Type> types = const [ReadingDataPoint, _$ReadingDataPoint];

  @override
  final String wireName = r'ReadingDataPoint';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReadingDataPoint object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'stationId';
    yield serializers.serialize(
      object.stationId,
      specifiedType: const FullType(String),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReadingDataPoint object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReadingDataPointBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'stationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.stationId = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReadingDataPoint deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReadingDataPointBuilder();
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

