//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/air_temperature_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'air_temperature_response.g.dart';

/// AirTemperatureResponse
///
/// Properties:
/// * [code] 
/// * [errorMsg] 
/// * [data] 
@BuiltValue()
abstract class AirTemperatureResponse implements Built<AirTemperatureResponse, AirTemperatureResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int get code;

  @BuiltValueField(wireName: r'errorMsg')
  String? get errorMsg;

  @BuiltValueField(wireName: r'data')
  AirTemperatureData? get data;

  AirTemperatureResponse._();

  factory AirTemperatureResponse([void updates(AirTemperatureResponseBuilder b)]) = _$AirTemperatureResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AirTemperatureResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AirTemperatureResponse> get serializer => _$AirTemperatureResponseSerializer();
}

class _$AirTemperatureResponseSerializer implements PrimitiveSerializer<AirTemperatureResponse> {
  @override
  final Iterable<Type> types = const [AirTemperatureResponse, _$AirTemperatureResponse];

  @override
  final String wireName = r'AirTemperatureResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AirTemperatureResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(int),
    );
    if (object.errorMsg != null) {
      yield r'errorMsg';
      yield serializers.serialize(
        object.errorMsg,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType.nullable(AirTemperatureData),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AirTemperatureResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AirTemperatureResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.code = valueDes;
          break;
        case r'errorMsg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMsg = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AirTemperatureData),
          ) as AirTemperatureData?;
          if (valueDes == null) continue;
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
  AirTemperatureResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AirTemperatureResponseBuilder();
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

