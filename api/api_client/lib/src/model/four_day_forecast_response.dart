//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/four_day_forecast_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'four_day_forecast_response.g.dart';

/// FourDayForecastResponse
///
/// Properties:
/// * [code] 
/// * [errorMsg] 
/// * [data] 
@BuiltValue()
abstract class FourDayForecastResponse implements Built<FourDayForecastResponse, FourDayForecastResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int get code;

  @BuiltValueField(wireName: r'errorMsg')
  String? get errorMsg;

  @BuiltValueField(wireName: r'data')
  FourDayForecastData? get data;

  FourDayForecastResponse._();

  factory FourDayForecastResponse([void updates(FourDayForecastResponseBuilder b)]) = _$FourDayForecastResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FourDayForecastResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FourDayForecastResponse> get serializer => _$FourDayForecastResponseSerializer();
}

class _$FourDayForecastResponseSerializer implements PrimitiveSerializer<FourDayForecastResponse> {
  @override
  final Iterable<Type> types = const [FourDayForecastResponse, _$FourDayForecastResponse];

  @override
  final String wireName = r'FourDayForecastResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FourDayForecastResponse object, {
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
        specifiedType: const FullType.nullable(FourDayForecastData),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    FourDayForecastResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FourDayForecastResponseBuilder result,
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
            specifiedType: const FullType.nullable(FourDayForecastData),
          ) as FourDayForecastData?;
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
  FourDayForecastResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FourDayForecastResponseBuilder();
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

