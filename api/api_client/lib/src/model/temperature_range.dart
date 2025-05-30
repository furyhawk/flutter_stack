//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'temperature_range.g.dart';

/// TemperatureRange
///
/// Properties:
/// * [low] 
/// * [high] 
/// * [unit] 
@BuiltValue()
abstract class TemperatureRange implements Built<TemperatureRange, TemperatureRangeBuilder> {
  @BuiltValueField(wireName: r'low')
  int get low;

  @BuiltValueField(wireName: r'high')
  int get high;

  @BuiltValueField(wireName: r'unit')
  String get unit;

  TemperatureRange._();

  factory TemperatureRange([void updates(TemperatureRangeBuilder b)]) = _$TemperatureRange;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TemperatureRangeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TemperatureRange> get serializer => _$TemperatureRangeSerializer();
}

class _$TemperatureRangeSerializer implements PrimitiveSerializer<TemperatureRange> {
  @override
  final Iterable<Type> types = const [TemperatureRange, _$TemperatureRange];

  @override
  final String wireName = r'TemperatureRange';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TemperatureRange object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'low';
    yield serializers.serialize(
      object.low,
      specifiedType: const FullType(int),
    );
    yield r'high';
    yield serializers.serialize(
      object.high,
      specifiedType: const FullType(int),
    );
    yield r'unit';
    yield serializers.serialize(
      object.unit,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TemperatureRange object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TemperatureRangeBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'low':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.low = valueDes;
          break;
        case r'high':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.high = valueDes;
          break;
        case r'unit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.unit = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TemperatureRange deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TemperatureRangeBuilder();
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

