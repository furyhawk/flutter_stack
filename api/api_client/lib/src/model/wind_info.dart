//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wind_info.g.dart';

/// WindInfo
///
/// Properties:
/// * [speed] 
/// * [direction] 
@BuiltValue()
abstract class WindInfo implements Built<WindInfo, WindInfoBuilder> {
  @BuiltValueField(wireName: r'speed')
  BuiltMap<String, JsonObject?> get speed;

  @BuiltValueField(wireName: r'direction')
  String get direction;

  WindInfo._();

  factory WindInfo([void updates(WindInfoBuilder b)]) = _$WindInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WindInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WindInfo> get serializer => _$WindInfoSerializer();
}

class _$WindInfoSerializer implements PrimitiveSerializer<WindInfo> {
  @override
  final Iterable<Type> types = const [WindInfo, _$WindInfo];

  @override
  final String wireName = r'WindInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WindInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'speed';
    yield serializers.serialize(
      object.speed,
      specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
    );
    yield r'direction';
    yield serializers.serialize(
      object.direction,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    WindInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WindInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'speed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>;
          result.speed.replace(valueDes);
          break;
        case r'direction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.direction = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WindInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WindInfoBuilder();
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

