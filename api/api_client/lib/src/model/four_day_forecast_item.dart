//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'four_day_forecast_item.g.dart';

/// FourDayForecastItem
///
/// Properties:
/// * [date] 
/// * [updatedTimestamp] 
/// * [timestamp] 
/// * [forecasts] 
@BuiltValue()
abstract class FourDayForecastItem implements Built<FourDayForecastItem, FourDayForecastItemBuilder> {
  @BuiltValueField(wireName: r'date')
  String get date;

  @BuiltValueField(wireName: r'updatedTimestamp')
  DateTime get updatedTimestamp;

  @BuiltValueField(wireName: r'timestamp')
  DateTime get timestamp;

  @BuiltValueField(wireName: r'forecasts')
  BuiltList<BuiltMap<String, JsonObject?>> get forecasts;

  FourDayForecastItem._();

  factory FourDayForecastItem([void updates(FourDayForecastItemBuilder b)]) = _$FourDayForecastItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FourDayForecastItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FourDayForecastItem> get serializer => _$FourDayForecastItemSerializer();
}

class _$FourDayForecastItemSerializer implements PrimitiveSerializer<FourDayForecastItem> {
  @override
  final Iterable<Type> types = const [FourDayForecastItem, _$FourDayForecastItem];

  @override
  final String wireName = r'FourDayForecastItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FourDayForecastItem object, {
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
    yield r'forecasts';
    yield serializers.serialize(
      object.forecasts,
      specifiedType: const FullType(BuiltList, [FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)])]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    FourDayForecastItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FourDayForecastItemBuilder result,
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
        case r'forecasts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)])]),
          ) as BuiltList<BuiltMap<String, JsonObject?>>;
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
  FourDayForecastItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FourDayForecastItemBuilder();
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

