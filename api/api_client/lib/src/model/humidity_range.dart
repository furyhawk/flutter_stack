//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'humidity_range.g.dart';

/// HumidityRange
///
/// Properties:
/// * [low] 
/// * [high] 
/// * [unit] 
@BuiltValue()
abstract class HumidityRange implements Built<HumidityRange, HumidityRangeBuilder> {
  @BuiltValueField(wireName: r'low')
  int get low;

  @BuiltValueField(wireName: r'high')
  int get high;

  @BuiltValueField(wireName: r'unit')
  String get unit;

  HumidityRange._();

  factory HumidityRange([void updates(HumidityRangeBuilder b)]) = _$HumidityRange;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HumidityRangeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HumidityRange> get serializer => _$HumidityRangeSerializer();
}

class _$HumidityRangeSerializer implements PrimitiveSerializer<HumidityRange> {
  @override
  final Iterable<Type> types = const [HumidityRange, _$HumidityRange];

  @override
  final String wireName = r'HumidityRange';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HumidityRange object, {
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
    HumidityRange object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HumidityRangeBuilder result,
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
  HumidityRange deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HumidityRangeBuilder();
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

