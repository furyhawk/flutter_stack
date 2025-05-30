//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/wind_direction_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wind_direction_response.g.dart';

/// WindDirectionResponse
///
/// Properties:
/// * [code] 
/// * [errorMsg] 
/// * [data] 
@BuiltValue()
abstract class WindDirectionResponse implements Built<WindDirectionResponse, WindDirectionResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int get code;

  @BuiltValueField(wireName: r'errorMsg')
  String? get errorMsg;

  @BuiltValueField(wireName: r'data')
  WindDirectionData? get data;

  WindDirectionResponse._();

  factory WindDirectionResponse([void updates(WindDirectionResponseBuilder b)]) = _$WindDirectionResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WindDirectionResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WindDirectionResponse> get serializer => _$WindDirectionResponseSerializer();
}

class _$WindDirectionResponseSerializer implements PrimitiveSerializer<WindDirectionResponse> {
  @override
  final Iterable<Type> types = const [WindDirectionResponse, _$WindDirectionResponse];

  @override
  final String wireName = r'WindDirectionResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WindDirectionResponse object, {
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
        specifiedType: const FullType.nullable(WindDirectionData),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WindDirectionResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WindDirectionResponseBuilder result,
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
            specifiedType: const FullType.nullable(WindDirectionData),
          ) as WindDirectionData?;
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
  WindDirectionResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WindDirectionResponseBuilder();
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

