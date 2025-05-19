//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/forecast.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/forecast_period.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather_item.g.dart';

/// WeatherItem
///
/// Properties:
/// * [updateTimestamp] 
/// * [timestamp] 
/// * [validPeriod] 
/// * [forecasts] 
@BuiltValue()
abstract class WeatherItem implements Built<WeatherItem, WeatherItemBuilder> {
  @BuiltValueField(wireName: r'update_timestamp')
  DateTime get updateTimestamp;

  @BuiltValueField(wireName: r'timestamp')
  DateTime get timestamp;

  @BuiltValueField(wireName: r'valid_period')
  ForecastPeriod get validPeriod;

  @BuiltValueField(wireName: r'forecasts')
  BuiltList<Forecast> get forecasts;

  WeatherItem._();

  factory WeatherItem([void updates(WeatherItemBuilder b)]) = _$WeatherItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WeatherItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherItem> get serializer => _$WeatherItemSerializer();
}

class _$WeatherItemSerializer implements PrimitiveSerializer<WeatherItem> {
  @override
  final Iterable<Type> types = const [WeatherItem, _$WeatherItem];

  @override
  final String wireName = r'WeatherItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WeatherItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'update_timestamp';
    yield serializers.serialize(
      object.updateTimestamp,
      specifiedType: const FullType(DateTime),
    );
    yield r'timestamp';
    yield serializers.serialize(
      object.timestamp,
      specifiedType: const FullType(DateTime),
    );
    yield r'valid_period';
    yield serializers.serialize(
      object.validPeriod,
      specifiedType: const FullType(ForecastPeriod),
    );
    yield r'forecasts';
    yield serializers.serialize(
      object.forecasts,
      specifiedType: const FullType(BuiltList, [FullType(Forecast)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    WeatherItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WeatherItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'update_timestamp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updateTimestamp = valueDes;
          break;
        case r'timestamp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.timestamp = valueDes;
          break;
        case r'valid_period':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ForecastPeriod),
          ) as ForecastPeriod;
          result.validPeriod.replace(valueDes);
          break;
        case r'forecasts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Forecast)]),
          ) as BuiltList<Forecast>;
          result.forecasts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WeatherItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherItemBuilder();
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

