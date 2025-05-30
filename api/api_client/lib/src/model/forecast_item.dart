//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/general_forecast.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'forecast_item.g.dart';

/// ForecastItem
///
/// Properties:
/// * [date] 
/// * [updatedTimestamp] 
/// * [timestamp] 
/// * [general] 
/// * [periods] 
@BuiltValue()
abstract class ForecastItem implements Built<ForecastItem, ForecastItemBuilder> {
  @BuiltValueField(wireName: r'date')
  String get date;

  @BuiltValueField(wireName: r'updatedTimestamp')
  DateTime get updatedTimestamp;

  @BuiltValueField(wireName: r'timestamp')
  DateTime get timestamp;

  @BuiltValueField(wireName: r'general')
  GeneralForecast get general;

  @BuiltValueField(wireName: r'periods')
  BuiltList<BuiltMap<String, JsonObject?>>? get periods;

  ForecastItem._();

  factory ForecastItem([void updates(ForecastItemBuilder b)]) = _$ForecastItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ForecastItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ForecastItem> get serializer => _$ForecastItemSerializer();
}

class _$ForecastItemSerializer implements PrimitiveSerializer<ForecastItem> {
  @override
  final Iterable<Type> types = const [ForecastItem, _$ForecastItem];

  @override
  final String wireName = r'ForecastItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ForecastItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'date';
    yield serializers.serialize(
      object.date,
      specifiedType: const FullType(String),
    );
    yield r'updatedTimestamp';
    yield serializers.serialize(
      object.updatedTimestamp,
      specifiedType: const FullType(DateTime),
    );
    yield r'timestamp';
    yield serializers.serialize(
      object.timestamp,
      specifiedType: const FullType(DateTime),
    );
    yield r'general';
    yield serializers.serialize(
      object.general,
      specifiedType: const FullType(GeneralForecast),
    );
    if (object.periods != null) {
      yield r'periods';
      yield serializers.serialize(
        object.periods,
        specifiedType: const FullType.nullable(BuiltList, [FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)])]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ForecastItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ForecastItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.date = valueDes;
          break;
        case r'updatedTimestamp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedTimestamp = valueDes;
          break;
        case r'timestamp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.timestamp = valueDes;
          break;
        case r'general':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GeneralForecast),
          ) as GeneralForecast;
          result.general.replace(valueDes);
          break;
        case r'periods':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)])]),
          ) as BuiltList<BuiltMap<String, JsonObject?>>?;
          if (valueDes == null) continue;
          result.periods.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ForecastItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ForecastItemBuilder();
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

