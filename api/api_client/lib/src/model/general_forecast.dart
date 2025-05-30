//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/wind_info.dart';
import 'package:api_client/src/model/humidity_range.dart';
import 'package:api_client/src/model/forecast_period_general.dart';
import 'package:api_client/src/model/forecast_info.dart';
import 'package:api_client/src/model/temperature_range.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'general_forecast.g.dart';

/// GeneralForecast
///
/// Properties:
/// * [validPeriod] 
/// * [temperature] 
/// * [relativeHumidity] 
/// * [forecast] 
/// * [wind] 
@BuiltValue()
abstract class GeneralForecast implements Built<GeneralForecast, GeneralForecastBuilder> {
  @BuiltValueField(wireName: r'validPeriod')
  ForecastPeriodGeneral get validPeriod;

  @BuiltValueField(wireName: r'temperature')
  TemperatureRange get temperature;

  @BuiltValueField(wireName: r'relativeHumidity')
  HumidityRange get relativeHumidity;

  @BuiltValueField(wireName: r'forecast')
  ForecastInfo get forecast;

  @BuiltValueField(wireName: r'wind')
  WindInfo get wind;

  GeneralForecast._();

  factory GeneralForecast([void updates(GeneralForecastBuilder b)]) = _$GeneralForecast;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeneralForecastBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeneralForecast> get serializer => _$GeneralForecastSerializer();
}

class _$GeneralForecastSerializer implements PrimitiveSerializer<GeneralForecast> {
  @override
  final Iterable<Type> types = const [GeneralForecast, _$GeneralForecast];

  @override
  final String wireName = r'GeneralForecast';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeneralForecast object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'validPeriod';
    yield serializers.serialize(
      object.validPeriod,
      specifiedType: const FullType(ForecastPeriodGeneral),
    );
    yield r'temperature';
    yield serializers.serialize(
      object.temperature,
      specifiedType: const FullType(TemperatureRange),
    );
    yield r'relativeHumidity';
    yield serializers.serialize(
      object.relativeHumidity,
      specifiedType: const FullType(HumidityRange),
    );
    yield r'forecast';
    yield serializers.serialize(
      object.forecast,
      specifiedType: const FullType(ForecastInfo),
    );
    yield r'wind';
    yield serializers.serialize(
      object.wind,
      specifiedType: const FullType(WindInfo),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GeneralForecast object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GeneralForecastBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'validPeriod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ForecastPeriodGeneral),
          ) as ForecastPeriodGeneral;
          result.validPeriod.replace(valueDes);
          break;
        case r'temperature':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TemperatureRange),
          ) as TemperatureRange;
          result.temperature.replace(valueDes);
          break;
        case r'relativeHumidity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HumidityRange),
          ) as HumidityRange;
          result.relativeHumidity.replace(valueDes);
          break;
        case r'forecast':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ForecastInfo),
          ) as ForecastInfo;
          result.forecast.replace(valueDes);
          break;
        case r'wind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(WindInfo),
          ) as WindInfo;
          result.wind.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GeneralForecast deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeneralForecastBuilder();
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

