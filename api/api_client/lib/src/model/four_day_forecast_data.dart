//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/four_day_forecast_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'four_day_forecast_data.g.dart';

/// FourDayForecastData
///
/// Properties:
/// * [records] 
/// * [paginationToken] 
@BuiltValue()
abstract class FourDayForecastData implements Built<FourDayForecastData, FourDayForecastDataBuilder> {
  @BuiltValueField(wireName: r'records')
  BuiltList<FourDayForecastItem> get records;

  @BuiltValueField(wireName: r'paginationToken')
  String? get paginationToken;

  FourDayForecastData._();

  factory FourDayForecastData([void updates(FourDayForecastDataBuilder b)]) = _$FourDayForecastData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FourDayForecastDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FourDayForecastData> get serializer => _$FourDayForecastDataSerializer();
}

class _$FourDayForecastDataSerializer implements PrimitiveSerializer<FourDayForecastData> {
  @override
  final Iterable<Type> types = const [FourDayForecastData, _$FourDayForecastData];

  @override
  final String wireName = r'FourDayForecastData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FourDayForecastData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'records';
    yield serializers.serialize(
      object.records,
      specifiedType: const FullType(BuiltList, [FullType(FourDayForecastItem)]),
    );
    if (object.paginationToken != null) {
      yield r'paginationToken';
      yield serializers.serialize(
        object.paginationToken,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    FourDayForecastData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FourDayForecastDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'records':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(FourDayForecastItem)]),
          ) as BuiltList<FourDayForecastItem>;
          result.records.replace(valueDes);
          break;
        case r'paginationToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paginationToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FourDayForecastData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FourDayForecastDataBuilder();
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

