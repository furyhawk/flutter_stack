//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/forecast_item.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/area_metadata.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'twenty_four_hour_forecast_data.g.dart';

/// TwentyFourHourForecastData
///
/// Properties:
/// * [areaMetadata] 
/// * [records] 
/// * [paginationToken] 
@BuiltValue()
abstract class TwentyFourHourForecastData implements Built<TwentyFourHourForecastData, TwentyFourHourForecastDataBuilder> {
  @BuiltValueField(wireName: r'area_metadata')
  BuiltList<AreaMetadata>? get areaMetadata;

  @BuiltValueField(wireName: r'records')
  BuiltList<ForecastItem> get records;

  @BuiltValueField(wireName: r'paginationToken')
  String? get paginationToken;

  TwentyFourHourForecastData._();

  factory TwentyFourHourForecastData([void updates(TwentyFourHourForecastDataBuilder b)]) = _$TwentyFourHourForecastData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TwentyFourHourForecastDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TwentyFourHourForecastData> get serializer => _$TwentyFourHourForecastDataSerializer();
}

class _$TwentyFourHourForecastDataSerializer implements PrimitiveSerializer<TwentyFourHourForecastData> {
  @override
  final Iterable<Type> types = const [TwentyFourHourForecastData, _$TwentyFourHourForecastData];

  @override
  final String wireName = r'TwentyFourHourForecastData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TwentyFourHourForecastData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.areaMetadata != null) {
      yield r'area_metadata';
      yield serializers.serialize(
        object.areaMetadata,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AreaMetadata)]),
      );
    }
    yield r'records';
    yield serializers.serialize(
      object.records,
      specifiedType: const FullType(BuiltList, [FullType(ForecastItem)]),
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
    TwentyFourHourForecastData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TwentyFourHourForecastDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'area_metadata':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AreaMetadata)]),
          ) as BuiltList<AreaMetadata>?;
          if (valueDes == null) continue;
          result.areaMetadata.replace(valueDes);
          break;
        case r'records':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ForecastItem)]),
          ) as BuiltList<ForecastItem>;
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
  TwentyFourHourForecastData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TwentyFourHourForecastDataBuilder();
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

